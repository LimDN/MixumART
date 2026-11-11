#!/bin/bash
# Compute SHA256 for a MixumART release tarball and update the formula.
# Usage: dist/update-homebrew-formula.sh [tag]
# Example: dist/update-homebrew-formula.sh v0.1.0
set -euo pipefail

REPO="EmergeShift/MixumART"
TAG="${1:-}"

if [ -z "$TAG" ]; then
  echo "Usage: $0 <tag>"
  echo "Example: $0 v0.1.0"
  exit 1
fi

URL="https://github.com/${REPO}/archive/refs/tags/${TAG}.tar.gz"
FORMULA="Formula/mixum.rb"

echo "==> Fetching $URL"
SHA=$(curl -sL "$URL" | shasum -a 256 | awk '{print $1}')

if [ -z "$SHA" ]; then
  echo "ERROR: Failed to compute SHA256"
  exit 1
fi

echo "SHA256: $SHA"

if [ ! -f "$FORMULA" ]; then
  echo "ERROR: Formula not found at $FORMULA"
  exit 1
fi

echo "==> Updating $FORMULA"
sed -i.bak "s|^  url .*|  url \"${URL}\"|" "$FORMULA"
sed -i.bak "s|^  sha256 .*|  sha256 \"${SHA}\"|" "$FORMULA"
rm -f "${FORMULA}.bak"

echo "==> Updated formula:"
cat "$FORMULA"

echo ""
echo "==> Next steps:"
echo "git add $FORMULA"
echo "git commit -m \"chore(homebrew): update mixum to $TAG\""
echo "git push"
