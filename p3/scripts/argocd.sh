#!/bin/bash

# https://kubernetes.io/docs/tasks/administer-cluster/namespaces/

sudo kubectl create namespace argocd && sudo kubectl create namespace dev

# https://argo-cd.readthedocs.io/en/stable/
sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# cheking and add host 
HOST_ENTRY="127.0.0.1 argocd.mydomain.com"
HOSTS_FILE="/etc/hosts"

if grep -q "$HOST_ENTRY" "$HOSTS_FILE"; then
    echo "exist $HOSTS_FILE"
else
    echo "adding $HOSTS_FILE"
    echo "$HOST_ENTRY" | sudo tee -a "$HOSTS_FILE"
fi

#waitpod
sudo kubectl wait --for=condition=ready --timeout=600s pod --all -n argocd

# argocd localhost:8085 or argocd.mydomain.com:8085
sudo kubectl port-forward svc/argocd-server -n argocd 8085:443 > /dev/null 2>&1 &

# password to argocd (user: admin)
echo -n -e "${GREEN}ARGOCD PASSWORD : "
  sudo kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode
echo -e "${RESET}"