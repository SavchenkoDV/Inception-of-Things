# Inception-of-Things
## PART 1

1. [Install VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads)
2. [Install Vagrant](https://developer.hashicorp.com/vagrant/downloads)<br>
&emsp; 2.1 vagrant init - initialize Vagrantfile
&emsp; 2.2 vim Vagrantfile - open Vagrantfile -> [describe the configuration](https://developer.hashicorp.com/vagrant/docs/vagrantfile) -> save -> vagrant up
3. [Installing K3s mater and K3s agent](https://docs.k3s.io/quick-start)<br>
&emsp; 3.1 [Documentation for flags Master](https://docs.k3s.io/cli/server) - [example](https://github.com/SavchenkoDV/Inception-of-Things/blob/main/p1/scripts/server.sh)
&emsp; 3.2 [Documentation for flags Worker](https://docs.k3s.io/cli/agent)  - [example](https://github.com/SavchenkoDV/Inception-of-Things/blob/main/p1/scripts/worker.sh) 

## PART 2





Additional Information:
1. Vagrant: 
- vagrant - vagrant manual
- vagrant init - initialize the Vagrantfile
- vim Vagrantfile - configure Vagrantfile
- vagrant up - raise virtual machines
- vagrant destroy - destroy virtual machines
- vagrant status - shows the current status of virtual machines
- vagrant global status - shows the status of active virtual machines
- vagrant validate - checking the validity of Vagrantfile
- vagrant ssh <machine name> - to connect to the machine via ssh
2. Net:
- nc -vz 192.168.56.110 6443 - Check connection availability
- ss -tlnp - show listening ports - views open ports
- cat /etc/netplan - nets configs
3. Kubernetes:
- kubectl get all -n [namespace-name] - view all resources in a specific namespace
- kubectl get all --all-namespaces - view all resources in all namespaces
- kubectl get [pod, ingress, or another Kubernetes resource] -n [namespace-name] -o yaml - show YAML manifest information about a specific Kubernetes resource in some namespace
- kubectl describe [pod, ingress, or another essence of k8s] -n [namespace-name] - show detailed information about a specific Kubernetes resource in some namespace
- kubectl exec -it [pod-name] -- /bin/sh - access the Pod