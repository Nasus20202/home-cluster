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

echo Updating helm repositories...
helm repo add jetstack https://charts.jetstack.io
helm repo add vm https://victoriametrics.github.io/helm-charts/
helm repo add harbor https://helm.goharbor.io
helm repo add jellyfin https://jellyfin.github.io/jellyfin-helm
helm repo update

echo Applying traefik configuration...
kubectl apply -f traefik

echo Installing upgrade-controller...
kubectl apply -k upgrade-controller

echo Installing cert-manager...
helm upgrade --install cert-manager jetstack/cert-manager -f cert-manager/values.yaml --create-namespace --namespace cert-manager --atomic
kubectl apply -k cert-manager/clusterissuer

echo Installing VictoriaMetrics...
helm upgrade --install vm vm/victoria-metrics-k8s-stack -f victoria-metrics/values.yaml --create-namespace --namespace victoria-metrics --atomic

echo Installing Harbor...
helm upgrade --install harbor harbor/harbor -f harbor/values.yaml --create-namespace --namespace harbor --atomic

echo Installing Jellyfin...
helm upgrade --install jellyfin jellyfin/jellyfin -f jellyfin/values.yaml  --create-namespace --namespace jellyfin --atomic
