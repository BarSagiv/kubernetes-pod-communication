# kubernetes-pod-communication

# 🛠 Kubernetes Pod-to-Pod Communication Demo

This project demonstrates basic pod-to-pod communication in Kubernetes, using both direct IP access and internal DNS resolution.  
The goal: Test connectivity between a pod running an NGINX server and another pod using a custom Alpine image with `curl`.

---

## 📁 Project Files

- `Dockerfile` – Builds a minimal Alpine-based image with `curl` installed.
- `nginx-pod.yaml` – Defines a pod running an NGINX server.
- `user-pod.yaml` – Defines a pod that uses the custom image to test network communication.

---

## 🧪 Steps to Run the Demo

1. **Deploy the NGINX pod:**
   ```bash
   kubectl apply -f nginx-pod.yaml
Build and push the custom curl image:

bash
Copy
Edit
docker build -t your-dockerhub-username/curl-alpine .
docker push your-dockerhub-username/curl-alpine
Deploy the user pod:

bash
Copy
Edit
kubectl apply -f user-pod.yaml
Get the NGINX pod IP:

bash
Copy
Edit
kubectl get pod nginx-pod -o wide
Access the user pod shell:

bash
Copy
Edit
kubectl exec -it user-pod -- /bin/sh
Test connectivity using NGINX pod IP:

bash
Copy
Edit
curl http://<nginx-pod-IP>
Test connectivity using internal DNS:

bash
Copy
Edit
curl http://nginx-pod
✅ Result
If everything is working correctly, the curl command from user-pod should return the default NGINX welcome page, proving successful pod-to-pod communication via both IP and DNS.

🔧 Requirements
Kubernetes cluster (e.g., Minikube or Kind)

Docker installed and logged into Docker Hub

kubectl CLI

📌 Notes
The user-pod.yaml includes stdin: true and tty: true so the container stays running for interactive access.

Alpine doesn't include curl by default, so it's manually installed in the Dockerfile.