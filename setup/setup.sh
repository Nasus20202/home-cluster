#!/bin/bash
set -e

if [ -f /etc/rancher/k3s/k3s.yaml ]; then
    echo "K3s is already installed."
else
    echo "Installing K3s..."
    curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="server" sh -s
    sudo cp kubelet.conf.d/* /var/lib/rancher/k3s/agent/etc/kubelet.conf.d/
fi

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

echo Install and configure Argo CD...
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update
helm install argocd argo/argo-cd -f ../apps/argocd/values.yaml --namespace argocd --create-namespace --atomic
kubectl apply -f ../apps/argocd/root-app.yaml
