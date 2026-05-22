# scripts

My personal scripts folder. Random stuff I use day-to-day on my work laptop.

## What's in here

| Script | What it does |
|---|---|
| `vpn.sh` | Quick connect to work VPN |
| `web-check.sh` | Pings work website and Slack me if down |
| `k8s-bad-pods.sh` | Lists pods that aren't Running/Completed |
| `k8s-tail.sh` | Tails logs from all pods matching a label |
| `disk-check.sh` | SSH into a list of hosts and check disk usage |
| `http-check.sh` | curl a list of URLs, show status + response time |
| `docker-clean.sh` | Nuke dangling docker images/volumes |
| `tunnel.sh` | Open SSH tunnel through bastion to a remote port |
| `git-cleanup.sh` | Deletes merged local branches |

Some scripts read config from `.env` in this folder. Adapt to your own.
