#!/bin/bash
# Quick connect to work VPN.

set -a
source "$(dirname "$0")/.env"
set +a

: "${VPN_HOST:?VPN_HOST not set in .env}"
: "${VPN_USER:?VPN_USER not set in .env}"
: "${VPN_PASS:?VPN_PASS not set in .env}"

echo "[*] Connecting to ${VPN_HOST}:${VPN_PORT:-10443} as ${VPN_USER}..."

sudo openfortivpn "${VPN_HOST}:${VPN_PORT:-10443}" \
    --username="${VPN_USER}" \
    --password="${VPN_PASS}" \
    --trusted-cert="${VPN_CERT_SHA256}"
