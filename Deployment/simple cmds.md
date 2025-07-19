# Create production namespace

```bash
kubectl create namespace production
```

### Verify certificate status

```bash
kubectl get certificates -n production
kubectl describe certificate api-prod -n production
```

# Troubleshoot certificate challenges

```bash
kubectl get challenges -n production
kubectl describe challenge api-prod-121fda -n production

```

# Deploy Redis

```bash
kubectl apply -f redis/redis-deployment.yaml -n production
kubectl apply -f redis/redis-service.yaml -n production
```

# Verify Redis deployment

```bash
kubectl get pods -n production | grep redis

```

### Ingress Configuration

# Apply ingress configuration

```bash
kubectl apply -f ingress.yaml -n production
```

# Verify ingress

```bash
kubectl get ingress -n production
dig +short api.example.com
dig +short api.sub.example.com
```

# Check certificates

```bash
kubectl get certificates -n production
```

### update the server

```bash
kubectl rollout restart deployment prod-backend -n production

```
