#!/bin/bash
# Quick setup script for Slide Agent

set -e

echo "🎯 Slide Agent Quick Setup"
echo "=========================="

# Install Python packages
echo "📦 Installing Python packages..."
pip3 install python-pptx mcp pydantic httpx pillow matplotlib pandas openpyxl pyyaml python-dotenv click rich

# Install Node packages
echo "📦 Installing Node packages..."
npm install -g @anthropic/claude-code @modelcontextprotocol/server-filesystem

# Clone PowerPoint MCP Server
echo "📦 Setting up PowerPoint MCP Server..."
if [ ! -d "mcp-servers/powerpoint-mcp" ]; then
    git clone https://github.com/GongRzhe/Office-PowerPoint-MCP-Server.git mcp-servers/powerpoint-mcp
fi

# Create output directories
mkdir -p presentations templates/professional templates/academic templates/creative

echo ""
echo "✅ Setup complete!"
echo ""
echo "To get started:"
echo "1. Run: claude code"
echo "2. Say: 'Create a presentation about [your topic]'"