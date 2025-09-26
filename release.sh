#!/bin/bash
set -e

# Get the latest version (from git tags)
VERSION=$(git describe --tags --abbrev=0)

# Extract the latest changelog section
NOTES=$(awk '/^### / {if (p) exit; p=1} p' CHANGELOG.md)

# Create GitHub release
gh release create "$VERSION" \
  --title "Release $VERSION" \
  --notes "$NOTES"

echo "✅ GitHub Release $VERSION created successfully!"
