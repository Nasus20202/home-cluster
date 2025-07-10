# Home Cluster

Localhost home cluster setup using Kubernetes.

## Setup

1. Run `./setup.sh`
2. Run `sudo cat hosts >> /etc/hosts`
3. Run `./trust-ca.sh`

## Apps

| App                        | Description        | URL                                      |
| -------------------------- | ------------------ | ---------------------------------------- |
| Jellyfin                   | Media server       | [jellyfin.local](https://jellyfin.local) |
| Harbor                     | Container registry | [harbor.local](https://harbor.local)     |
| Victoria Metcics / Grafana | Monitoring         | [grafana.local](https://grafana.local)   |
| qBittorrent                | Torrent client     | [torrent.local](https://torrent.local)   |
