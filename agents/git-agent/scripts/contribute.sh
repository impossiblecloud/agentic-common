#!/bin/bash
# contribute.sh — commit and push changes in any git repo
# Usage: contribute.sh "<repo-path>" "<commit message>"

set -e

REPO="$1"
MSG="$2"

if [ -z "$REPO" ] || [ -z "$MSG" ]; then
  echo "Usage: contribute.sh <repo-path> <commit-message>"
  exit 1
fi

if [ ! -d "$REPO/.git" ]; then
  echo "ERROR: No git repo found at $REPO"
  exit 1
fi

cd "$REPO"

echo "Pulling latest changes..."
git pull --rebase

echo "Staging changes..."
git add .

if git diff --staged --quiet; then
  echo "No changes to share. Everything already up to date."
  exit 0
fi

git commit -m "$MSG"
git push

echo ""
echo "Done! Your changes are now shared."
