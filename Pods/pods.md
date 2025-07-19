### Kubernetes Pods - The Smallest Deployable Unit

- A Pod is the smallest deployable unit in Kubernetes. A Pod represents a single instance of a running process in your cluster.

### What is a Pod?

- A Pod (as in a pod of whales or pea pod) is a group of one or more containers.(Usually One)
- The containers in a Pod share the network, storage and lifecycle.
- A pod can communicate with each other using `localhost`.
- They are scheduled and run on worker nodes.

### Why do we need Pods?

- Pods are the smallest deployable units of computing that you can create and manage in Kubernetes.
- A Pod represents a unit of deployment: a single instance of an application in Kubernetes, which might consist of either a single container or a small number of containers that are tightly coupled and that share resources.
- Pods are the atomic unit on the Kubernetes platform.

### Pod Characteristics:

- Pods are mortal. They are born and when they die, they are not resurrected.
- Pods in Kubernetes are ephemeral, which means they are not persistent.
- Pods are designed to be disposable and replaceable.
- Pods are usually managed by a Kubernetes controller.
- All containers in a Pod share the same network namespace.
- Pods can use Volumes to share data among containers.

### Pod Lifecycle:

- Pending: The Pod has been accepted by the Kubernetes system, but one or more of the containers has not been set up.
- Running: The Pod has been bound to a node, and all of the containers have been created.
- Succeeded: All containers in the Pod have terminated in success, and will not be restarted.
- Failed: All containers in the Pod have terminated, and at least one container has terminated in failure.
- Unknown: For some reason the state of the Pod could not be obtained.

### Creating a Pod:

- Using yaml file:
  ````yaml
  apiVersion: v1
  kind: Pod
  metadata:
  name: myapp-pod
  labels:
      app: myapp
  spec:
      containers:
      - name: myapp-container
          image: busybox
          command: ['sh', '-c', 'echo Hello Kubernetes! && sleep 3600']
  ```
  ````
- Using kubectl:

  ```bash
  kubectl run myapp-pod --image=busybox --command -- echo "Hello Kubernetes!"
  ```

### Viewing Pods:

- Using kubectl:
  ```bash
  kubectl get pods              # List all pods
  kubectl describe pod my-pod   # Get detailed info
  kubectl logs my-pod           # View logs of a container
  kubectl delete pod my-pod     # Delete a pod
  ```

### View pods details:

- Using kubectl:
  ```bash
  kubectl get pod myapp-pod -o yaml  # Get detailed YAML output of a specific pod
  kubectl get pods -o wide            # Get more details including node and IP
  ```

### Pod Debugging:

- Using kubectl:
  ```bash
  kubectl exec -it myapp-pod -- /bin/sh  # Get a shell inside the pod
  ```

### Get updated pod deployment files changes:

```bash
kubectl get deployment myapp-deployment -o yaml
```
