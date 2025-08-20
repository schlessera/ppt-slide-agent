#!/bin/bash

# Slide Agent One-Line Installer
# Usage: curl -fsSL https://raw.githubusercontent.com/schlessera/ppt-slide-agent/main/install.sh | bash

set -e

REPO_NAME="ppt-slide-agent"
DEFAULT_DIR="${HOME}/${REPO_NAME}"
GITHUB_REPO="https://github.com/schlessera/ppt-slide-agent.git"

echo "🎯 Slide Agent Installer - Claude Code + PowerPoint MCP"
echo "======================================================="

# Ask for installation directory if running interactively
if [ -t 0 ] && [ -t 1 ]; then
    echo ""
    echo "📍 Where would you like to install Slide Agent?"
    echo "   Default: $DEFAULT_DIR"
    echo ""
    read -p "   Installation directory (press Enter for default): " USER_DIR
    INSTALL_DIR="${USER_DIR:-$DEFAULT_DIR}"
    
    # Expand tilde and environment variables
    INSTALL_DIR="${INSTALL_DIR/#\~/$HOME}"
    INSTALL_DIR=$(eval echo "$INSTALL_DIR")
else
    # Non-interactive mode (piped from curl)
    INSTALL_DIR="$DEFAULT_DIR"
fi

echo ""
echo "📂 Installing to: $INSTALL_DIR"
echo ""

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

# Run verification quietly
source "$INSTALL_DIR/venv/bin/activate" 2>/dev/null && python "$INSTALL_DIR/scripts/verify-install.py" --quiet 2>/dev/null
VERIFY_RESULT=$?

# Display clean summary
echo ""
echo "═══════════════════════════════════════════════════════════════"
if [ $VERIFY_RESULT -eq 0 ]; then
    echo "✅ Slide Agent Installation Complete!"
else
    echo "⚠️  Slide Agent Installation Complete (with warnings)"
fi
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📍 Installed at: $INSTALL_DIR"
echo ""
echo "🚀 Get Started (just 2 steps):"
echo "   1. cd $INSTALL_DIR"
echo "   2. claude code"
echo ""
echo "💡 First command to try:"
echo "   /slide-create \"My First Presentation\""
echo ""
if [ $VERIFY_RESULT -ne 0 ]; then
    echo "⚠️  To check warnings: cd $INSTALL_DIR && python scripts/verify-install.py"
    echo ""
fi
echo "📖 Learn more: README.md | 🐛 Issues: GitHub.com/schlessera/ppt-slide-agent"
echo "═══════════════════════════════════════════════════════════════"