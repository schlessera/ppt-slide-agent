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

# Run verification
echo ""
echo "🔍 Verifying installation..."
source "$INSTALL_DIR/venv/bin/activate" 2>/dev/null && python "$INSTALL_DIR/scripts/verify-install.py" --quiet 2>/dev/null
VERIFY_RESULT=$?

echo ""
echo "======================================================="
if [ $VERIFY_RESULT -eq 0 ]; then
    echo "✅ Installation COMPLETE and VERIFIED!"
else
    echo "⚠️  Installation completed with warnings"
    echo "   Run verification manually: cd $INSTALL_DIR && source venv/bin/activate && python scripts/verify-install.py"
fi
echo "======================================================="
echo ""
echo "📍 Installation Location: $INSTALL_DIR"
echo ""
echo "🚀 Quick Start:"
echo "   1. Navigate to project:  cd $INSTALL_DIR"
echo "   2. Start Claude Code:    claude code"
echo "   3. Create presentation:  Type: /slide-create 'Your Topic'"
echo ""
echo "📚 Available Commands:"
echo "   /slide-create [topic]    - Create new presentation"
echo "   /slide-research [topic]  - Research content"
echo "   /slide-optimize         - Optimize design"
echo "   /slide-export [format]  - Export (pptx, pdf, images)"
echo ""
echo "🔧 Optional: Add API keys to $INSTALL_DIR/.env"
echo "   - OPENAI_API_KEY       (for GPT-based features)"
echo "   - ANTHROPIC_API_KEY    (for Claude API)"
echo "   - TAVILY_API_KEY       (for web research)"
echo "   - GITHUB_TOKEN         (for template access)"
echo ""
echo "📖 Documentation: $INSTALL_DIR/README.md"
echo "🐛 Issues: https://github.com/schlessera/ppt-slide-agent/issues"