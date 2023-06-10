#!/bin/bash

if curl -sfL https://get.k3s.io | sh -
then
echo -e "\n\033[32m K3s SUCCESS"
else
echo -e "\033[0m\n\033[0m\033[31m K3s FAILURE!"
fi

if export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san serverS --node-ip 192.168.56.110  --bind-address=192.168.56.110 --advertise-address=192.168.56.110"
then
echo -e "\n\033[32m SUCCESS FILE EXPORT"
else
echo -e "\033[0m\n\033[0m\033[31m FAILURE FILE EXPORT!"
fi

#sudo cat /var/lib/rancher/k3s/server/node-token