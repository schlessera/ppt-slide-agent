#!/bin/bash

# Slide Agent One-Line Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/schlessera/ppt-slide-agent/main/install.sh | bash

set -e

REPO_NAME="ppt-slide-agent"
INSTALL_DIR="${HOME}/${REPO_NAME}"
GITHUB_REPO="https://github.com/schlessera/ppt-slide-agent.git"

echo "🎯 Slide Agent Installer - Claude Code + PowerPoint MCP"
echo "======================================================="

# Clone or update repository
if [ -d "$INSTALL_DIR" ]; then
    echo "📦 Updating existing installation..."
    cd "$INSTALL_DIR"
    git pull
else
    echo "📦 Cloning slide-agent repository..."
    git clone "$GITHUB_REPO" "$INSTALL_DIR"
    cd "$INSTALL_DIR"
fi

# Run setup script
echo "🚀 Running setup..."
bash scripts/setup.sh

echo ""
echo "✅ Installation complete!"
echo ""
echo "📝 Next steps:"
echo "1. Start Claude Code: claude code"
echo "2. Navigate to: cd $INSTALL_DIR"
echo "3. Say: 'Create a presentation about [your topic]'"
echo ""
echo "For more info: cat $INSTALL_DIR/README.md"