#!/bin/bash

#https://kubernetes.io/docs/tasks/administer-cluster/namespaces/

kubectl create namespace argocd && kubectl create namespace dev

# https://argo-cd.readthedocs.io/en/stable/
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# cheking and add host
HOST_ENTRY="127.0.0.1 argocd.mydomain.co"
HOSTS_FILE="/etc/hosts"

if grep -q "$HOST_ENTRY" "$HOSTS_FILE"; then
    echo "exist $HOSTS_FILE"
else
    echo "adding $HOSTS_FILE"
    echo "$HOST_ENTRY" | sudo tee -a "$HOSTS_FILE"
fi

#waitpod
kubectl wait --for=condition=ready --timeout=600s pod --all -n argocd

# argocd localhost:8085
kubectl port-forward svc/argocd-server -n argocd 8085:443 > /dev/null 2>&1 &

# password to argocd
echo -n -e "${GREEN}ARGOCD PASSWORD : "
  kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode
echo -e "${RESET}"


#BONUS PART



# after install k3d cluster create gitlab namespace
sudo kubectl create namespace gitlab

# install helm - https://helm.sh/
sudo snap install helm --classic

# cheking and add host
HOST_ENTRY="127.0.0.1 gitlab.k3d.gitlab.com"
HOSTS_FILE="/etc/hosts"

if grep -q "$HOST_ENTRY" "$HOSTS_FILE"; then
    echo "exist $HOSTS_FILE"
else
    echo "adding $HOSTS_FILE"
    echo "$HOST_ENTRY" | sudo tee -a "$HOSTS_FILE"
fi
 
# deploy gitlab to k3d - https://docs.gitlab.com/charts/installation/deployment.html
#		       - https://gitlab.com/gitlab-org/charts/gitlab/-/tree/master/examples?ref_type=heads
helm repo add gitlab https://charts.gitlab.io/
helm repo update 
helm upgrade --install gitlab gitlab/gitlab \
  -n gitlab \
  -f https://gitlab.com/gitlab-org/charts/gitlab/raw/master/examples/values-minikube-minimum.yaml \
  --set global.hosts.domain=k3d.gitlab.com \
  --set global.hosts.externalIP=0.0.0.0 \
  --set global.https=false \	
  --timeout 600s

#waitpod
kubectl wait --for=condition=ready --timeout=1200s pod --all -n gitlab

# argocd localhost:8087
sudo kubectl port-forward svc/gitlab-webservice-default -n gitlab 8087:8080 2>&1 >/dev/null &


helm upgrade --install gitlab gitlab/gitlab \
  -n gitlab \
  -f ./values-minikube-minimum.yaml \
  --set global.hosts.domain=gitlab.k3d.gitlab.com \
  --set global.hosts.externalIP=0.0.0.0

