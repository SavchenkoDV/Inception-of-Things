#!/bin/bash

GREEN="\033[32m"
RED="\033[31m"
RESET="\033[0m"

if kubectl apply -f /vagrant/manifests/deployment.yaml; then
    echo -e "${GREEN}All pods created SUCCEESSFULLY${RESET}"
else
    echo -e "${RED}Creating pods FAILED${RESET}"
fi


