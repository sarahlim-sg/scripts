#!/bin/bash
# Cron this every 5 min to get pinged on Slack if the site goes down.
# */5 * * * * /home/sarah/scripts/web-check.sh

URL="https://altitudedronelabs.com"

# slack webhook - get from .env
source "$(dirname "$0")/.env" 2>/dev/null

status=$(curl -o /dev/null -s -w "%{http_code}" --max-time 10 "$URL")

if [ "$status" != "200" ] && [ -n "$SLACK_WEBHOOK" ]; then
    curl -sX POST "$SLACK_WEBHOOK" \
        -H 'Content-Type: application/json' \
        --data "{\"text\":\":rotating_light: ${URL} returned HTTP ${status}\"}" > /dev/null
fi
