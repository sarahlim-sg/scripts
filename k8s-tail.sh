#!/bin/bash
# Tail logs from all pods matching a label selector.
# Usage: ./k8s-tail.sh app=api [namespace]

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <label-selector> [namespace]"
    echo "Example: $0 app=api default"
    exit 1
fi

SELECTOR="$1"
NS="${2:-default}"

kubectl logs -n "$NS" -l "$SELECTOR" --all-containers=true --tail=50 -f --max-log-requests 10
