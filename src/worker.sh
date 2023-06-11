#!/bin/bash

if export K3S_TOKEN=$(cat /vagrant/token.env) && rm /vagrant/token.env
then
echo -e "\n\033[32m EXPORT TOKEN SUCCESS \033[0m"
else
echo -e "\033[0m\n\033[0m\033[31m  EXPORT TOKEN FAILURE! \033[0m"
fi

if curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.111:6443 K3S_TOKEN=${TOKEN} sh -
then
echo -e "\n\033[32m The installation script with the K3S_URL and K3S_TOKEN environment variables SUCCESS \033[0m"
else
echo -e "\033[0m\n\033[0m\033[31m The installation script with the K3S_URL and K3S_TOKEN environment variables FAILURE! \033[0m"
fi

if export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 serverWorkerSW --node-ip 192.168.56.111 --bind-address=192.168.56.111 --advertise-address=192.168.56.111"
then
echo -e "\n\033[32m SUCCESS FILE EXPORT\033[0"
else
echo -e "\033[0m\n\033[0m\033[31m FAILURE FILE EXPORT!\033[0"
fi

if sudo ip link add eth1 type dummy && sudo ip addr add 192.168.56.111/24 dev eth1 && sudo ip link set eth1 up
then
echo -e "\n\033[32m eth1 SUCCESS\033[0"
else
echo -e "\033[0m\n\033[0m\033[31m eth1 FAILURE!\033[0"
fi