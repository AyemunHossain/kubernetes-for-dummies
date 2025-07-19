### 🎯 What Is a Context in Kubernetes?

A **context** in Kubernetes is a convenient configuration that tells `kubectl`:

- **Which cluster** to connect to
- **Which user credentials** to use
- **Which namespace** to default to

Contexts are defined in your kubeconfig file (usually located at `~/.kube/config`). They make it easy to switch between different clusters, users, and namespaces without having to specify them each time you run a command.

### 📦 A context is made up of:

```yaml
context:
  name: my-context
  context:
    cluster: my-cluster
    user: my-user
    namespace: my-namespace # optional
```

### 🧪 View Current Context

```bash
kubectl config current-context
```

### 📋 List All Contexts

```bash
kubectl config get-contexts

```

### 🔄 Switch Context

```bash
kubectl config use-context prod-context

```

### ⚡ Tips

You can set a default namespace per context so you don’t need -n every time.

```bash
kubectl --context=dev-aks-context get pods
```
