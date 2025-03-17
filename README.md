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
![Untitled](https://github.com/SavchenkoDV/Inception-of-Things/assets/78852244/ad56d49c-9248-420f-9ed5-87e2e41b505c)

#### To complete this part, you must install VirtualBox, Vagrant, create a [Vagrantfile](https://github.com/SavchenkoDV/Inception-of-Things/blob/main/p2/Vagrantfile) which, using the “vagrant up” command, will launch virtual machine and use your [script](https://github.com/SavchenkoDV/Inception-of-Things/tree/main/p2/scripts) to install k3s master on these virtual machine (see the installation description in PART 1).
#### The next step is to write a K8S manifest, which will be launched by Vagrant inside the virtual machine.
The K8S [manifest](https://github.com/SavchenkoDV/Inception-of-Things/blob/main/p2/confs/deployment.yaml) consists of:
1. [Deployment](https://kubernetes.io/docs/concepts/workloads/controllers/deployment/) - in Kubernetes manages Pods and ReplicaSets, ensuring the desired number of pod replicas, specified in its configuration, are running and up-to-date. [Volume](https://kubernetes.io/docs/concepts/storage/volumes/) inside Deployment manifest plays a key role in managing data storage and availability within pods. Our pods which contains nginx are linked with our [applications](https://github.com/SavchenkoDV/Inception-of-Things/tree/main/p2/rsc).
2. [Services](https://kubernetes.io/docs/concepts/services-networking/service/) - in Kubernetes acts as a stable network interface to a dynamic set of Pods, facilitating internal or external network communication to these Pods.<br>
3. [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) - in Kubernetes is a way to route external HTTP and HTTPS traffic to internal Services, providing features like URL routing, load balancing, and SSL termination.
#### The last step is to use the [script](https://github.com/SavchenkoDV/Inception-of-Things/blob/main/p2/scripts/add_hosts.sh) on the local machine  to add hosts  - to view our applications through the browser.
![Untitled](https://github.com/SavchenkoDV/Inception-of-Things/assets/78852244/75b83eb1-cfb4-4591-9e0c-ed5b69fc654a)
## PART 3
![292326348-a778f1b0-40f1-4af3-974f-bc045e07ce97](https://github.com/SavchenkoDV/Inception-of-Things/assets/78852244/c9318b1a-aeea-439c-b281-94815f41240c)
#### Consistently following the links from our description will allow you to understand how this and the bonus part are performed. We have made comments in our scripts that contain all the links to the documentations.
#### For this part you need to install K3S in Docker = [K3D](https://github.com/SavchenkoDV/Inception-of-Things/blob/main/p3/scripts/k3d.sh). Install [ArgoCD](https://github.com/SavchenkoDV/Inception-of-Things/blob/main/p3/scripts/argocd.sh) into the K3S cluster. Run the ArgoCD [script](https://github.com/SavchenkoDV/Inception-of-Things/blob/main/p3/scripts/init.sh) which start [manifest](https://github.com/SavchenkoDV/Inception-of-Things/blob/main/p3/confs/deploy.yaml) to deploy the application, using the manifest (see what consist K8S manifest in PART 2) which is located in a specially created [github repository](https://github.com/SavchenkoDV/buthor/blob/main/manifests/application.yaml) = CI/CD. In the bonus part we used [helm](https://helm.sh/), you need to [install git, helm and deploy gitlab](https://github.com/SavchenkoDV/Inception-of-Things/blob/main/bonus/scripts/gitlab.sh) to the k3s cluster. Create a project [manually](https://github.com/SavchenkoDV/Inception-of-Things/blob/main/bonus/README.md) and [put the manifest there, which is in our github](https://github.com/SavchenkoDV/Inception-of-Things/blob/main/bonus/scripts/update_repo.sh).
---
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
---
