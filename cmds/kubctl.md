### kubectl Cheat Sheet

# Basic Commands

1. `kubectl get nodes` - List all nodes in the cluster.
2. `kubectl get pods` - List all pods in the current namespace.
3. `kubectl get services` - List all services in the current namespace.
4. `kubectl get deployments` - List all deployments in the current namespace.
5. `kubectl get namespaces` - List all namespaces in the cluster.
6. `kubectl get configmaps` - List all config maps in the current namespace.
7. `kubectl get secrets` - List all secrets in the current namespace.
8. `kubectl get events` - List all events in the current namespace.
9. `kubectl get ingress` - List all ingress resources in the current namespace.

# Pods

1. `kubectl get pods` - List all pods in the current namespace.
2. `kubectl describe pod <pod-name>` - Show details about a specific pod.
3. `kubectl logs <pod-name>` - Fetch logs from a specific pod.
4. `kubectl exec -it <pod-name> -- /bin/bash` - Open a shell in a specific pod.
5. `kubectl delete pod <pod-name>` - Delete a specific pod.

### Get a pods env variables

```bash
kubectl exec <pod-name> -- printenv
```

### Get a pods IP address

```bash
kubectl get pod <pod-name> -o jsonpath='{.status.podIP}'
```
