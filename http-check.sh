#!/bin/bash
# Quick HTTP status + response time check on a list of URLs.

URLS=(
    "https://api.example.com/health"
    "https://api.example.com/v1/status"
)

for url in "${URLS[@]}"; do
    result=$(curl -o /dev/null -s -w "%{http_code} | %{time_total}s | %{size_download} bytes" \
        --max-time 10 "$url")
    printf "%-50s %s\n" "$url" "$result"
done
