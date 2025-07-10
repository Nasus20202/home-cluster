#!/bin/bash

echo "Trusting self signed root CA certificate..."
sudo cp ../apps/cert-manager/clusterissuer/tls.crt /usr/local/share/ca-certificates/home-cluster.crt 
sudo cp ../apps/cert-manager/clusterissuer/tls.crt /etc/pki/ca-trust/source/anchors/home-cluster.crt 
sudo update-ca-certificates
sudo update-ca-trust
