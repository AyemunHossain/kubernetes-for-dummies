### What is kubernetes?
- Kubernetes (K8s) is an open-source container orchestration platform that automates deployment, scaling, and management of containerized applications. It helps manage applications efficiently in a cluster of machines.

### What is a container?
- A container is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another.

### Why Kubernetes?
- Before Kubernetes, managing multiple containers across different environments (dev, staging, production) was complex. Kubernetes solves key challenges:
- **Automated Scaling**: Kubernetes can automatically scale your application based on resource usage.
- **Self-healing**: Kubernetes can detect and restart containers when they fail.
- **Service discovery and load balancing**: Kubernetes can route traffic to the appropriate container.
- **Automated rollouts and rollbacks**: Kubernetes can manage the rollout of new versions of an application.
- **Declarative configuration**: Kubernetes allows you to define your desired state and will work to make your current state match the desired state.
- **Multi-cloud**: Kubernetes is cloud-agnostic and can run on any cloud provider.

### Key Kubernetes Objects:
- **Pod**: A group of one or more containers, with shared storage/network, and a specification for how to run the containers.
- **Deployment**: A controller that manages a replicated application, ensuring the desired number of pods are running.
- **Service**: An abstraction that defines a logical set of pods and a policy by which to access them.
- **Namespace**: A way to divide cluster resources between multiple users.
- **Volume**: A directory that can be mounted into a container (Persistent storage for stateful apps).