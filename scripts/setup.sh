#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "🔧 Setting up Slide Agent Environment"
echo "======================================"

# Detect OS
if [[ "$OSTYPE" == "linux-gnu"* ]] || [[ "$(uname -r)" == *"microsoft"* ]]; then
    OS="linux"
    if [[ "$(uname -r)" == *"microsoft"* ]]; then
        echo "📍 Detected: WSL Environment"
    else
        echo "📍 Detected: Linux Environment"
    fi
else
    echo "⚠️  Warning: This script is optimized for Linux/WSL"
    echo "   Continuing with basic setup..."
fi

# Check prerequisites
echo ""
echo "📋 Checking prerequisites..."

# Check Python
if command -v python3 &> /dev/null; then
    PYTHON_VERSION=$(python3 --version 2>&1 | awk '{print $2}')
    echo "✅ Python $PYTHON_VERSION found"
else
    echo "❌ Python3 not found. Installing..."
    sudo apt update && sudo apt install -y python3 python3-pip python3-venv
fi

# Check Node.js
if command -v node &> /dev/null; then
    NODE_VERSION=$(node --version)
    echo "✅ Node.js $NODE_VERSION found"
else
    echo "❌ Node.js not found. Installing..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    sudo apt install -y nodejs
fi

# Check npm
if command -v npm &> /dev/null; then
    NPM_VERSION=$(npm --version)
    echo "✅ npm $NPM_VERSION found"
else
    echo "❌ npm not found. Installing..."
    sudo apt install -y npm
fi

# Check Claude Code
if command -v claude &> /dev/null; then
    echo "✅ Claude Code CLI found"
else
    echo "📦 Installing Claude Code CLI..."
    npm install -g @anthropic/claude-code
fi

# Setup Python environment
echo ""
echo "🐍 Setting up Python environment..."
cd "$PROJECT_ROOT"

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    python3 -m venv venv
    echo "✅ Virtual environment created"
fi

# Activate and install Python dependencies
source venv/bin/activate
pip install --upgrade pip

# Install PowerPoint MCP dependencies
echo ""
echo "📊 Installing PowerPoint MCP dependencies..."
cat > requirements.txt << 'EOF'
python-pptx>=0.6.21
mcp>=0.1.0
uvloop>=0.17.0
httpx>=0.24.0
pydantic>=2.0.0
pillow>=10.0.0
matplotlib>=3.7.0
pandas>=2.0.0
openpyxl>=3.1.0
EOF

pip install -r requirements.txt

# Install MCP servers
echo ""
echo "🔌 Installing MCP servers..."

# Install PowerPoint MCP server
if [ ! -d "mcp-servers/powerpoint-mcp" ]; then
    git clone https://github.com/GongRzhe/Office-PowerPoint-MCP-Server.git mcp-servers/powerpoint-mcp
    cd mcp-servers/powerpoint-mcp
    pip install -e .
    cd "$PROJECT_ROOT"
fi

# Install GitHub MCP server (useful for template management)
npm install -g @modelcontextprotocol/server-github

# Setup Claude Code configuration
echo ""
echo "⚙️  Configuring Claude Code..."
bash "$SCRIPT_DIR/configure-claude.sh"

# Setup hooks
echo ""
echo "🪝 Setting up hooks..."
bash "$SCRIPT_DIR/setup-hooks.sh"

# Create CLAUDE.md for project instructions
echo ""
echo "📝 Creating project instructions..."
bash "$SCRIPT_DIR/create-claude-md.sh"

# Setup is complete - install.sh will handle verification and final output
echo ""
echo "✨ Setup complete!"