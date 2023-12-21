# Inception-of-Things
## PART 1
#### In this part, you must install VirtualBox, Vagrant, create a [Vagrantfile](https://github.com/SavchenkoDV/Inception-of-Things/blob/main/p1/Vagrantfile) which, using the “vagrant up” command, will launch two virtual machines and use your [scripts](https://github.com/SavchenkoDV/Inception-of-Things/blob/main/p1/scripts) to install k3s master and worker on these virtual machines. 
1. [Install VirtualBox](https://www.virtualbox.org/wiki/Linux_Downloads)
2. [Install Vagrant](https://developer.hashicorp.com/vagrant/downloads)<br>
&emsp; 2.1 vagrant init - initialize Vagrantfile<br>
&emsp; 2.2 vim Vagrantfile - open Vagrantfile -> [describe the configuration](https://developer.hashicorp.com/vagrant/docs/vagrantfile) -> save -> vagrant up
3. [Installing K3s mater and K3s agent](https://docs.k3s.io/quick-start)<br>
&emsp; 3.1 [Documentation for flags Master](https://docs.k3s.io/cli/server) - [example](https://github.com/SavchenkoDV/Inception-of-Things/blob/main/p1/scripts/server.sh)<br>
&emsp; 3.2 [Documentation for flags Worker](https://docs.k3s.io/cli/agent)  - [example](https://github.com/SavchenkoDV/Inception-of-Things/blob/main/p1/scripts/worker.sh) 

## PART 2
#### To complete this part, you must install VirtualBox, Vagrant, create a [Vagrantfile](https://github.com/SavchenkoDV/Inception-of-Things/blob/main/p2/Vagrantfile) which, using the “vagrant up” command, will launch virtual machine and use your [script](https://github.com/SavchenkoDV/Inception-of-Things/tree/main/p2/scripts) to install k3s master on these virtual machine (see the installation description in PART 1).
#### The next step is to write a K8S manifest, which will be launched by Vagrant inside the virtual machine.
The K8S [manifest](https://github.com/SavchenkoDV/Inception-of-Things/blob/main/p2/confs/deployment.yaml) consists of:
1. [Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) - in Kubernetes manages Pods and ReplicaSets, ensuring the desired number of pod replicas, specified in its configuration, are running and up-to-date. [Volume](https://kubernetes.io/docs/concepts/storage/volumes/) inside Deployment manifest plays a key role in managing data storage and availability within pods. Our pods which contains nginx are linked with our [applications](https://github.com/SavchenkoDV/Inception-of-Things/tree/main/p2/rsc).
2. [Services](https://kubernetes.io/docs/concepts/services-networking/service/) - in Kubernetes acts as a stable network interface to a dynamic set of Pods, facilitating internal or external network communication to these Pods.<br>
3. [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) - in Kubernetes is a way to route external HTTP and HTTPS traffic to internal Services, providing features like URL routing, load balancing, and SSL termination.
#### 

https://github.com/SavchenkoDV/Inception-of-Things/blob/main/p2/scripts/server.sh

![PART 2](https://github.com/SavchenkoDV/Inception-of-Things/assets/78852244/14261349-6290-498c-8a6c-5725a927f73a)
## PART 3
![image](https://github.com/SavchenkoDV/Inception-of-Things/assets/78852244/a778f1b0-40f1-4af3-974f-bc045e07ce97)


 
#### Additional Information:
##### Vagrant: 
  ```
- vagrant - vagrant manual
- vagrant init - initialize the Vagrantfile
- vim Vagrantfile - configure Vagrantfile
- vagrant up - raise virtual machines
- vagrant destroy - destroy virtual machines
- vagrant status - shows the current status of virtual machines
- vagrant global status - shows the status of active virtual machines
- vagrant validate - checking the validity of Vagrantfile
- vagrant ssh <machine name> - to connect to the machine via ssh
  ```
##### Net:
```
- nc -vz 192.168.56.110 6443 - Check connection availability
- ss -tlnp - show listening ports - views open ports
- cat /etc/netplan - nets configs
```
##### Kubernetes:
```
- kubectl get all -n [namespace-name] - view all resources in a specific namespace
- kubectl get all --all-namespaces - view all resources in all namespaces
- kubectl get [pod, ingress, or another Kubernetes resource] -n [namespace-name] -o yaml - show YAML manifest information about a specific Kubernetes resource in some namespace
- kubectl describe [pod, ingress, or another essence of k8s] -n [namespace-name] - show detailed information about a specific Kubernetes resource in some namespace
- kubectl exec -it [pod-name] -- /bin/sh - access the Pod
```
