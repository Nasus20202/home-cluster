#!/bin/bash

if [ -f /etc/rancher/k3s/k3s.yaml ]; then
    echo "K3s is already installed."
else
    echo "Installing K3s..."
    curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" INSTALL_K3S_EXEC="server" sh -s
fi

export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

echo "Applying upgrade-controller configuration..."
kubectl apply -k upgrade-controller
