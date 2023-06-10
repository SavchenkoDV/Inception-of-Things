# Inception-of-Things

1. Установить Vagrant - https://developer.hashicorp.com/vagrant/downloads
  * vagrant - мануал вагранта
  * vagrant init - инициализируем Vagrantfile
  * vim vagrantfile - конфигурируем Vagrantfile
  * vagrant up - поднимаем виртуалки
  * vagrant destroy - уничтожаем виртуалки
  * vagrant status - показывает текущий статус виртуальных машин
  * vagrant global status - показывает статус активных виртуальных машин
  * ssh <имя машины> - для подключения к машине через ssh 

MASTER

curl -sfL https://get.k3s.io | sh -
export INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --tls-san serverS --node-ip 192.168.56.110  --bind-address=192.168.56.110 --advertise-address=192.168.56.110"
sudo cat /var/lib/rancher/k3s/server/node-token

sudo ufw allow 6443/tcp
sudo ufw allow 443/tcp
cat /etc/rancher/k3s/k3s.yaml
root@serverS:/home/vagrant# mkdir ~/.kube
root@serverS:/home/vagrant# cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
journalctl -u k3s

WORKER

curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=${TOKEN} sh -
-----------------------------------------------


nc -vz 192.168.56.110 6443 - check to connect

ss -tlnp - show listening ports

enp0s3 - netinterface (debian/ubuntu) 

/etc/netplan - nets configs

kubectl get node -owide - show general node


---------------

cat /etc/network/interfaces -> sudo apt install ifupdown

ss -tlnp - show listening ports

enp0s3 - netinterface (debian/ubuntu)

/etc/netplan - nets configs

kubectl get node -owide - show general node

cat /etc/network/interfaces -> sudo apt install ifupdown
