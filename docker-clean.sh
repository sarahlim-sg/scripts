#!/bin/bash
# Free up disk space by removing dangling docker stuff.

echo "Before:"
docker system df

echo ""
echo "Pruning..."
docker system prune -af --volumes

echo ""
echo "After:"
docker system df
