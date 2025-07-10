#!/bin/bash

echo "Trusting self signed root CA certificate..."
sudo cp cert-manager/clusterissuer/cert/tls.crt /usr/local/share/ca-certificates/my-ca.crt 
sudo cp cert-manager/clusterissuer/cert/tls.crt /etc/pki/ca-trust/source/anchors/my-ca.crt
sudo update-ca-certificates
sudo update-ca-trust
