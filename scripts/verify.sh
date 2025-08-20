#!/bin/bash

# PPT Slide Agent Verification Script
# Checks the new Claude Code structure

echo "🔍 PPT Slide Agent - Installation Verification"
echo "=============================================="
echo ""

# Check Claude Code structure
echo "📁 Checking Claude Code structure..."
if [ -d ".claude/commands" ] && [ -d ".claude/agents" ]; then
    echo "✅ .claude directory structure OK"
    echo "   Commands: $(ls -1 .claude/commands/*.md 2>/dev/null | wc -l) found"
    echo "   Agents: $(ls -1 .claude/agents/*.md 2>/dev/null | wc -l) found"
else
    echo "❌ .claude directory structure missing"
fi

# Check MCP configuration
echo ""
echo "⚙️  Checking MCP configuration..."
if [ -f ".mcp.json" ]; then
    echo "✅ .mcp.json found"
elif [ -f ".mcp.json.sample" ]; then
    echo "⚠️  .mcp.json not found (use .mcp.json.sample as template)"
else
    echo "❌ MCP configuration missing"
fi

# Check environment
echo ""
echo "🔧 Checking environment..."
if [ -f ".env" ]; then
    echo "✅ .env file found"
elif [ -f ".env.sample" ]; then
    echo "⚠️  .env not found (use .env.sample as template)"
else
    echo "❌ Environment configuration missing"
fi

# Check server
echo ""
echo "🖥️  Checking server..."
if [ -f "server/server.py" ]; then
    echo "✅ pptx-mcp server found"
    if [ -f "server/tools/slide_exporter.py" ]; then
        echo "✅ Slide exporter tool found"
    else
        echo "⚠️  Slide exporter tool missing"
    fi
else
    echo "❌ Server not found"
fi

# Check Python environment
echo ""
echo "🐍 Checking Python environment..."
if [ -d "venv" ]; then
    echo "✅ Virtual environment found"
    source venv/bin/activate 2>/dev/null
    if python -c "import pptx; import fastmcp" 2>/dev/null; then
        echo "✅ Required Python packages installed"
    else
        echo "⚠️  Some Python packages may be missing"
    fi
else
    echo "⚠️  Virtual environment not found"
fi

# Check directories
echo ""
echo "📂 Checking directories..."
if [ -d "presentations" ]; then
    echo "✅ Presentations directory found"
else
    echo "⚠️  Presentations directory missing"
fi

# Summary
echo ""
echo "=============================================="
echo "📊 Summary"
echo "=============================================="

if [ -d ".claude" ] && [ -f ".mcp.json" ] && [ -f "server/server.py" ]; then
    echo "✅ PPT Slide Agent is properly configured!"
    echo ""
    echo "🚀 Next steps:"
    echo "   1. cd $(pwd)"
    echo "   2. claude code"
    echo "   3. /slide-create \"Your Topic\""
else
    echo "⚠️  Some components need attention"
    echo ""
    echo "Run ./install.sh to complete setup"
fi