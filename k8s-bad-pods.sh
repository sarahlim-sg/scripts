#!/bin/bash
# List all pods that are not Running or Completed across all namespaces.

NAMESPACE="${1:---all-namespaces}"

if [ "$NAMESPACE" = "--all-namespaces" ]; then
    NS_FLAG="--all-namespaces"
else
    NS_FLAG="-n $NAMESPACE"
fi

kubectl get pods $NS_FLAG --no-headers 2>/dev/null | \
    awk '$4 != "Running" && $4 != "Completed" {print}'
