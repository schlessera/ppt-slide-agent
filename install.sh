#!/bin/bash

# PPT Slide Agent Installer for Claude Code
# Simplified installation with proper Claude Code structure

set -e

REPO_NAME="ppt-slide-agent"
DEFAULT_DIR="${HOME}/${REPO_NAME}"
GITHUB_REPO="https://github.com/schlessera/ppt-slide-agent.git"

echo "🎯 PPT Slide Agent Installer - Claude Code Edition"
echo "=================================================="

# Ask for installation directory if running interactively
if [ -t 0 ] && [ -t 1 ]; then
    echo ""
    echo "📍 Where would you like to install PPT Slide Agent?"
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
    echo "📦 Cloning repository..."
    git clone "$GITHUB_REPO" "$INSTALL_DIR"
    cd "$INSTALL_DIR"
fi

# Check prerequisites
echo ""
echo "🔍 Checking prerequisites..."

# Check Python
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version | cut -d' ' -f2)
    echo "✅ Python $PYTHON_VERSION found"
else
    echo "❌ Python 3 not found. Please install Python 3.8+"
    exit 1
fi

# Check Node.js
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version)
    echo "✅ Node.js $NODE_VERSION found"
else
    echo "❌ Node.js not found. Please install Node.js 18+"
    exit 1
fi

# Check Claude Code CLI
if command -v claude &> /dev/null; then
    echo "✅ Claude Code CLI found"
else
    echo "⚠️  Claude Code CLI not found. Installing..."
    npm install -g @anthropic-ai/claude-code
fi

# Check LibreOffice (optional but recommended)
if command -v libreoffice &> /dev/null; then
    echo "✅ LibreOffice found (slide export enabled)"
else
    echo "⚠️  LibreOffice not found (optional - needed for slide export)"
    echo "   Install with: sudo apt install libreoffice (Ubuntu/Debian)"
    echo "                brew install libreoffice (macOS)"
fi

# Set up Python environment
echo ""
echo "🐍 Setting up Python environment..."
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

source venv/bin/activate
pip install --upgrade pip --quiet

# Install server dependencies
echo "📦 Installing server dependencies..."
pip install -r server/requirements.txt --quiet

# Install FastMCP if not already installed
pip install fastmcp --quiet

# Copy configuration files
echo ""
echo "⚙️  Setting up configuration..."

# Copy .mcp.json if it doesn't exist
if [ ! -f ".mcp.json" ]; then
    cp .mcp.json.sample .mcp.json
    echo "✅ Created .mcp.json from template"
fi

# Copy .env if it doesn't exist
if [ ! -f ".env" ]; then
    cp .env.sample .env
    echo "✅ Created .env from template"
    echo "📝 Please edit .env to add API keys (optional)"
fi

# Create necessary directories
echo "📁 Creating project directories..."
mkdir -p presentations/templates presentations/exports

# Make scripts executable
chmod +x server/server.py
chmod +x server/tools/slide_exporter.py

# Test the setup
echo ""
echo "🔍 Verifying installation..."

# Quick test of Python imports
python3 -c "import pptx; import fastmcp; print('✅ Python packages OK')" 2>/dev/null || echo "⚠️  Some Python packages may need attention"

# Display summary
echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "✅ PPT Slide Agent Installation Complete!"
echo "═══════════════════════════════════════════════════════════════"
echo ""
echo "📍 Installed at: $INSTALL_DIR"
echo ""
echo "🚀 Get Started (just 2 steps):"
echo "   1. cd $INSTALL_DIR"
echo "   2. claude code"
echo ""
echo "💡 Your first command:"
echo "   /slide-create \"My First Presentation\""
echo ""
echo "📚 Available Commands:"
echo "   /slide-create    - Create a presentation"
echo "   /slide-research  - Research a topic"
echo "   /slide-optimize  - Optimize design"
echo "   /slide-export    - Export to multiple formats"
echo ""
echo "🔧 Optional: Edit .env for API keys (enables enhanced features)"
echo ""
echo "📖 Documentation: README.md | 🐛 Issues: GitHub.com/schlessera/ppt-slide-agent"
echo "═══════════════════════════════════════════════════════════════"