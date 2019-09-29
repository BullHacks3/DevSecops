### Various k8s Commands and their use cases ###

|Kubectl Command| Purpose |
|---------------|---------|
|kubectl version|check the version of k8s|
|kubectl get nodes||
|kubectl get pods| list pods in all the namespaces|
|kubectl describe [object_type] [name_of_object]| detailed information about the resource|
|kubectl describe pods [pod_name]| show the informaton about [pod_name]
|kubectl get services||
|kubectl get deployments||
|kubectl get replicasets||
|kubectl labels | update a label on a resources
|kubectl run | run a  particular image in a  cluster
|kubectl port-forward <pod_name> [localport]:[remoteport]|forwards local ports to pods
|kubectl attach <pod_name> -c <container_name> | used to attach to a process already running in a continaer
|kubectl exec -it [pod_name] -c [container_name]| execute a command in a container
|kubectl exposr [object_type] [name_of_object] [--port=ExternalPort] [--target-port=container-port] [--type=service-type]|exposes a port for a given deployment