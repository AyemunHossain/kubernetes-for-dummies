#!/bin/bash

# Set your credentials
USERNAME="username"
PASSWORD="password"

# Encode to base64
ENCODED_USERNAME=$(echo -n "$USERNAME" | base64)
ENCODED_PASSWORD=$(echo -n "$PASSWORD" | base64)

# Step 1: Create mongo-secret.yaml
cat <<EOF > mongo-secret.yaml
apiVersion: v1
kind: Secret
metadata:
  name: mongodb-secret
type: Opaque
data:
  mongo-root-username: $ENCODED_USERNAME
  mongo-root-password: $ENCODED_PASSWORD
EOF

echo "✅ Created mongo-secret.yaml"

# Step 2: Create mongo-deployment.yaml
cat <<EOF > mongo-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongo
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mongo
  template:
    metadata:
      labels:
        app: mongo
    spec:
      containers:
        - name: mongo
          image: mongo
          ports:
            - containerPort: 27017
          env:
            - name: MONGO_INITDB_ROOT_USERNAME
              valueFrom:
                secretKeyRef:
                  name: mongodb-secret
                  key: mongo-root-username
            - name: MONGO_INITDB_ROOT_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: mongodb-secret
                  key: mongo-root-password
---
apiVersion: v1
kind: Service
metadata:
  name: mongo-service
spec:
  selector:
    app: mongo
  ports:
    - protocol: TCP
      port: 27017
      targetPort: 27017
  type: ClusterIP
EOF

echo "✅ Created mongo-deployment.yaml"

# Step 3: Apply both YAMLs
kubectl apply -f mongo-secret.yaml
kubectl apply -f mongo-deployment.yaml

echo "🚀 MongoDB deployment and secret applied to the cluster."
