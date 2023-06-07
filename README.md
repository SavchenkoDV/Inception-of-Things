# Inception-of-Things

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-ru


export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san serverS --node-ip 192.168.56.110  --bind-address=192.168.56.110 --advertise-address=192.168.56.110"
curl -sfL https://get.k3s.io | sh -

cat /etc/rancher/k3s/k3s.yaml
root@serverS:/home/vagrant# mkdir ~/.kube
root@serverS:/home/vagrant# cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
journalctl -u k3s

MASTER
sudo ufw allow 6443/tcp
sudo ufw allow 443/tcp
sudo cat /var/lib/rancher/k3s/server/node-token
K10dfe874d97b7da4947161ffca0fffc9c7fd8076f6927b5844544908e74d105358::server:ea1200e6f8725d1109d03ab181f1151f
WORKER
curl -sfL http://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=K10dfe874d97b7da4947161ffca0fffc9c7fd8076f6927b5844544908e74d105358::server:ea1200e6f8725d1109d03ab181f1151f sh -s - --docker


nc -vz 192.168.56.110 6443 - check to connect

ss -tlnp - show listening ports

enp0s3 - netinterface (debian/ubuntu)

/etc/netplan - nets configs

kubectl get node -owide - show general node

cat /etc/network/interfaces -> sudo apt install ifupdown
