#!/usr/bin/env bash
set -euo pipefail

# Usage: ./scripts/publish.sh git@github.com:USERNAME/REPO.git
# Initializes git (if needed), commits all files, sets remote and pushes to feature/home.

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <git-remote-ssh-or-https-url>"
  exit 1
fi

REMOTE_URL="$1"
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
echo "Publishing from $ROOT_DIR to $REMOTE_URL"
cd "$ROOT_DIR"

if [ ! -d .git ]; then
  git init
fi

git add .
git commit -m "Initial commit: palette image app" || echo "No changes to commit"
git branch -M feature/home || true
git remote remove origin 2>/dev/null || true
git remote add origin "$REMOTE_URL"
git push -u origin feature/home

echo "Pushed to $REMOTE_URL"
