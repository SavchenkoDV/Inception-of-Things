#!/bin/bash

GREEN="\033[32m"
RED="\033[31m"
RESET="\033[0m"

# install git
sudo apt install git

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
#		               - https://gitlab.com/gitlab-org/charts/gitlab/-/tree/master/examples?ref_type=heads
sudo helm repo add gitlab https://charts.gitlab.io/
sudo helm repo update 
sudo helm upgrade --install gitlab gitlab/gitlab \
  -n gitlab \
  -f https://gitlab.com/gitlab-org/charts/gitlab/raw/master/examples/values-minikube-minimum.yaml \
  --set global.hosts.domain=k3d.gitlab.com \
  --set global.hosts.externalIP=0.0.0.0 \
  --set global.hosts.https=false \
  --timeout 600s

#waitpodloc
sudo kubectl wait --for=condition=ready --timeout=1200s pod -l app=webservice -n gitlab

# password to gitlab (user: root)
echo -n "${GREEN}GITLAB PASSWORD : "
  sudo kubectl get secret gitlab-gitlab-initial-root-password -n gitlab -o jsonpath="{.data.password}" | base64 --decode
echo "${RESET}"

# argocd localhost:80 or http://gitlab.k3d.gitlab.com
sudo kubectl port-forward svc/gitlab-webservice-default -n gitlab 80:8181 2>&1 >/dev/null &