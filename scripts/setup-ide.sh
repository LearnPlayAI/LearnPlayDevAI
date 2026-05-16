#!/usr/bin/env bash
set -Eeuo pipefail

# VS Code Extensions Setup Script
# Installs recommended VS Code extensions for the project.

echo "=== VS Code Extensions Setup ==="
echo ""
echo "This will install recommended extensions for development."
echo ""

RECOMMENDED_EXTENSIONS=(
  "saoudrizwan.claude-dev"    # Cline
  "eamol.gitlens"             # GitLens
  "dbaeumer.vscode-eslint"    # ESLint
  "esbenp.prettier-vscode"    # Prettier
)

for ext in "${RECOMMENDED_EXTENSIONS[@]}"; do
  echo "Installing: $ext"
  if command -v code &>/dev/null; then
    code --install-extension "$ext" 2>/dev/null || echo "  (Could not install $ext — may need to run in VS Code)"
  else
    echo "  ⚠ VS Code CLI not found. Install manually: code --install-extension $ext"
  fi
  echo ""
done

echo "=== Setup Complete ==="
echo ""
echo "Extensions to check in VS Code:"
for ext in "${RECOMMENDED_EXTENSIONS[@]}"; do
  echo "  - $ext"
done
echo ""
echo "Open VS Code and check the Extensions panel to verify installation."