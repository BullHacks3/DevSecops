### Kubernetes Architecture Components

k8s mainly consists of two type of nodes:

1. Master Nodes
2. Worker Nodes ( earlier known as minions)

Components of Master node:

|Components|Function|
|----------|--------|
|api server|
|controller|
|scheduler|
|etcd|


Components of Worker Node:
|Components|Function|
|----------|--------|
|kubelet||
|kube-proxy||
|docker||
|pods||


### Scaling Applications

It depends on the type of application, i.e whether is stateful or stateless application

| Application|Properties|
|------------|----------|
|Statefull| Requires persisitent storage for operation |
|Stateless| no persistent storage|

Note:
**CAP (Brewer Theorem)**: We can achieve only maximum of two properties out of ( consistency,availability,paritition tolerance) in case of distributed database system

Reference: 
[The engineering challenges of the data path
Presented by Bryan Cantrill](https://www.youtube.com/watch?v=fE2KDzZaxvE)


### Replicas
- Allows to define the number of replicas during the deployments
Few options available:
    - replicas
    - replicaset
    - bare pods
    - job
    - daemonset