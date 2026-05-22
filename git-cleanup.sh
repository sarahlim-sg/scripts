#!/bin/bash
# Delete local branches that are already merged into main.
# Run from inside any git repo.

set -e

if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Not a git repo"
    exit 1
fi

MAIN_BRANCH=$(git remote show origin 2>/dev/null | awk '/HEAD branch/ {print $NF}')
MAIN_BRANCH="${MAIN_BRANCH:-main}"

git checkout "$MAIN_BRANCH"
git pull

merged=$(git branch --merged | grep -v "^\*" | grep -v "$MAIN_BRANCH" | grep -v "master" || true)

if [ -z "$merged" ]; then
    echo "No merged branches to clean up."
    exit 0
fi

echo "Branches to delete:"
echo "$merged"
echo ""
read -p "Continue? (y/N): " confirm

if [ "$confirm" = "y" ]; then
    echo "$merged" | xargs -n 1 git branch -d
fi
