#!/bin/bash

if curl curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=${TOKEN} sh -
then
echo -e "\n\033[32m The installation script with the K3S_URL and K3S_TOKEN environment variables SUCCESS \033[0m"
else
echo -e "\033[0m\n\033[0m\033[31m The installation script with the K3S_URL and K3S_TOKEN environment variables FAILURE! \033[0m"
fi