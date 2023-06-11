#!/bin/bash

if curl -sfL https://get.k3s.io | sh -
then
echo -e "\n\033[32m K3s SUCCESS \033[0m"
else
echo -e "\033[0m\n\033[0m\033[31m K3s FAILURE! \033[0m"
fi

if export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san serverS --node-ip 192.168.56.110  --bind-address=192.168.56.110 --advertise-address=192.168.56.110"
then
echo -e "\n\033[32m SUCCESS FILE EXPORT\033[0"
else
echo -e "\033[0m\n\033[0m\033[31m FAILURE FILE EXPORT!\033[0"
fi

if sudo ip link add eth1 type dummy && sudo ip addr add 192.168.56.110/24 dev eth1 && sudo ip link set eth1 up
then
echo -e "\n\033[32m eth1 SUCCESS\033[0"
else
echo -e "\033[0m\n\033[0m\033[31m eth1 FAILURE!\033[0"
fi

if sudo cat /var/lib/rancher/k3s/server/token >> /vagrant/token.env
then
echo -e "\n\033[32m TOKEN SUCCESSFULLY SAVED\033[0"
else
echo -e "\033[0m\n\033[0m\033[31m TOKEN SAVING FAILED!\033[0"
fi
