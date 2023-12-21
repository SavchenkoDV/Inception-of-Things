#!/bin/bash

sudo apt-get update -y
sudo apt install curl -y
sudo apt install vim -y

# k3d https://k3d.io/v5.6.0/#what-is-k3d
# docker https://docs.docker.com/engine/install/ubuntu/

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# kubectl https://kubernetes.io/docs/tasks/tools/#kubectl

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# k3d https://k3d.io/v5.6.0/#releases
curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

sudo k3d cluster create buthorS
