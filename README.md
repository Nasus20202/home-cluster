# Home Cluster

Localhost home cluster setup using Kubernetes with GitOps via Argo CD.

## Setup

### Manual Setup (legacy)

1. Run `./setup.sh`
2. Run `sudo cat hosts >> /etc/hosts`
3. Run `./trust-ca.sh`

### GitOps Setup with Argo CD

1. Run `./setup-argocd.sh`
2. Run `sudo cat hosts >> /etc/hosts`
3. Run `./trust-ca.sh`
4. Update Git repository URLs in `argocd/root-app.yaml` and `apps/root/*.yaml` files
5. Access Argo CD at https://argocd.local to manage applications

## Apps

| App                        | Description        | URL                                      |
| -------------------------- | ------------------ | ---------------------------------------- |
| Argo CD                    | GitOps platform    | [argocd.local](https://argocd.local)     |
| Jellyfin                   | Media server       | [jellyfin.local](https://jellyfin.local) |
| Harbor                     | Container registry | [harbor.local](https://harbor.local)     |
| Victoria Metcics / Grafana | Monitoring         | [grafana.local](https://grafana.local)   |
| qBittorrent                | Torrent client     | [torrent.local](https://torrent.local)   |
