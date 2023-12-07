#!/bin/bash

GREEN="\033[32m"
RED="\033[31m"
RESET="\033[0m"

# install git
sudo apt install git

# init wil-app
sudo kubectl apply -f ../confs/deploy.yaml

# Warning port-forward
echo -e "${GREEN}PORT-FORWARD : sudo kubectl port-forward svc/svc-wil -n dev 8888:8080${RESET}"
