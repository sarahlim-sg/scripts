#!/bin/bash
# Check disk usage on a list of servers via SSH.
# Reads hosts from ~/.ssh/config or a file.

HOSTS_FILE="${1:-$HOME/.ssh/work-hosts}"

if [ ! -f "$HOSTS_FILE" ]; then
    echo "No hosts file at $HOSTS_FILE"
    echo "Create one with one hostname per line."
    exit 1
fi

while read -r host; do
    [ -z "$host" ] && continue
    [[ "$host" =~ ^# ]] && continue

    echo "=== $host ==="
    ssh -o ConnectTimeout=5 -o BatchMode=yes "$host" \
        "df -h | grep -E '^/dev|^Filesystem' | awk '\$5+0 > 70 || NR==1'" \
        2>/dev/null || echo "  (unreachable)"
    echo ""
done < "$HOSTS_FILE"
