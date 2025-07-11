# Home Cluster

Localhost home cluster setup using Kubernetes with GitOps via Argo CD.

## Setup

Run the following commands to set up the cluster:

```bash
cd setup
./setup-firewall.sh # if you are using firewalld
./setup.sh
./trust-ca.sh
sudo cat hosts >> /etc/hosts
```

## Apps

| App                        | Description        | URL                                      |
| -------------------------- | ------------------ | ---------------------------------------- |
| Argo CD                    | GitOps platform    | [argocd.local](https://argocd.local)     |
| Harbor                     | Container registry | [harbor.local](https://harbor.local)     |
| Jellyfin                   | Media server       | [jellyfin.local](https://jellyfin.local) |
| qBittorrent                | Torrent client     | [torrent.local](https://torrent.local)   |
| Victoria Metrics / Grafana | Monitoring         | [grafana.local](https://grafana.local)   |
