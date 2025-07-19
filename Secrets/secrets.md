### Secrets in kubernetes

- Secrets are used to store sensitive information such as passwords, OAuth tokens, SSH keys, etc. They are base64 encoded and can be mounted as files or environment variables in pods.
- Secrets are stored in etcd, which is encrypted at rest by default in Kubernetes clusters.
- Secrets can be created using YAML files or kubectl commands.

### Creating a Secret

- Using YAML file:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: mysecret
type: Opaque
data:
  username: YWRtaW4= # base64 encoded
  password: MWYyZDFlMmU2N2Rm
```

### Use the Secret in a Pod:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: myapp-pod
spec:
  containers:
    - name: myapp-container
      image: busybox
      env:
        - name: USERNAME
          valueFrom:
            secretKeyRef:
              name: mysecret
              key: username
        - name: PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysecret
              key: password
      restartPolicy: Never
```

### Registering a Secret with kubectl:

```bash
kubectl apply -f mysecret.yaml
```

### Viewing Secrets

```bash
kubectl get secrets
kubectl describe secret mysecret
```

### TLS secrets

- TLS secrets are used to store TLS certificates and keys.
- They are created with the type `kubernetes.io/tls`.

### Creating a TLS Secret

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: mytlssecret
type: kubernetes.io/tls
data:
  tls.crt: <base64-encoded-cert>
  tls.key: <base64-encoded-key>
```

### Use the TLS Secret in a ingress:

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: my-ingress
spec:
  tls:
    - hosts:
        - example.com
      secretName: mytlssecret
  rules:
    - host: example.com
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: myservice
                port:
                  number: 80
```
