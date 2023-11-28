#!/bin/bash

GREEN="\033[32m"
RED="\033[31m"
RESET="\033[0m"

if export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san serverS --node-ip 192.168.56.110 --bind-address=192.168.56.110 --advertise-address=192.168.56.110 "; then
    echo -e "${GREEN}export INSTALL_K3S_EXEC SUCCEEDED${RESET}"
else
    echo -e "${RED}export INSTALL_K3S_EXEC FAILED${RESET}"
fi

if curl -sfL https://get.k3s.io | sh -; then
    echo -e "${GREEN}K3s MASTER installation SUCCEEDED${RESET}"
else
    echo -e "${RED}K3s MASTER installation FAILED${RESET}"
fi

if sudo ip link add eth1 type dummy && sudo ip addr add 192.168.56.110/24 dev eth1 && sudo ip link set eth1 up; then
    echo -e "${GREEN}add eth1 SUCCEESSFULLY${RESET}"
else
    echo -e "${RED}add eth1 FAILED${RESET}"
fi
