#!/bin/bash

echo "🚀 Starting Minikube with Docker driver..."

newgrp docker <<EONG
minikube start --driver=docker
minikube status
EONG

echo "✅ Minikube started successfully. You can now use kubectl to interact with your cluster."