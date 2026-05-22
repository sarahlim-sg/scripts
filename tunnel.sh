#!/bin/bash
# Open a local SSH tunnel to a remote port.
# Usage: ./tunnel.sh <remote-host> <remote-port> [local-port]
# Example: ./tunnel.sh db.internal 5432       # local 5432 -> remote 5432

set -e

REMOTE_HOST="$1"
REMOTE_PORT="$2"
LOCAL_PORT="${3:-$REMOTE_PORT}"

if [ -z "$REMOTE_HOST" ] || [ -z "$REMOTE_PORT" ]; then
    echo "Usage: $0 <remote-host> <remote-port> [local-port]"
    exit 1
fi

BASTION="bastion"

echo "[*] Tunneling localhost:${LOCAL_PORT} -> ${REMOTE_HOST}:${REMOTE_PORT} via ${BASTION}"
echo "    Ctrl+C to close."

ssh -N -L "${LOCAL_PORT}:${REMOTE_HOST}:${REMOTE_PORT}" "$BASTION"
