### Kubernetes Ingress - Advanced Traffic Management

- [Ingress](https://kubernetes.io/docs/concepts/services-networking/ingress/) An Ingress in Kubernetes is a way to expose services externally using HTTP(S) routing. It acts as a reverse proxy and provides a single entry point for multiple services in a cluster.

### 📦 How Ingress Works

#### Without Ingress:

- You expose each service using a NodePort or LoadBalancer
- You manually map ports, which gets messy fast

#### With Ingress:

- You expose all internal services behind a single domain/IP
- Ingress uses rules to route incoming HTTP(S) traffic to the right service

### 🧪 Try it on Minikube

```bash
minikube addons enable ingress
minikube tunnel
```

### 🛠️ Ingress Controller

- An Ingress Controller is a component that implements the Ingress resource and manages the routing of external traffic to services.
- It listens for changes to Ingress resources and updates the routing rules accordingly.

### 📝 Example Ingress Resource

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: example-ingress
spec:
  rules:
    - host: example.com
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: example-service
                port:
                  number: 80
    - host: api.example.com
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: api-service
                port:
                  number: 80
```

### 🔍 Key Features of Ingress

- **Path-based Routing**: Route traffic based on the URL path.
- **Host-based Routing**: Route traffic based on the requested host.
- **TLS Termination**: Handle SSL/TLS termination at the Ingress level.
- **Load Balancing**: Distribute traffic across multiple backend services.
- **Rewrite and Redirect**: Modify request paths or redirect traffic to different URLs.
