#!/bin/bash
# PPT Slide Agent - Quick Start Script
# Just run: ./quick-start.sh

set -e

echo "🚀 PPT Slide Agent Quick Start"
echo "=============================="
echo ""

# Check if .env exists, if not create from sample
if [ ! -f ".env" ]; then
    if [ -f ".env.sample" ]; then
        cp .env.sample .env
        echo "✅ Created .env from sample"
        echo "📝 Note: Edit .env to add API keys for enhanced features (optional)"
        echo ""
    fi
fi

# Run the main setup
echo "Running setup..."
bash scripts/setup.sh

echo ""
echo "================================"
echo "✨ Setup Complete!"
echo "================================"
echo ""
echo "Next steps:"
echo "1. (Optional) Edit .env to add API keys"
echo "2. Start Claude Code: claude code"
echo "3. Create a presentation: /slide-create 'Your Topic'"
echo ""
echo "Repository: https://github.com/schlessera/ppt-slide-agent"
echo "Documentation: https://github.com/schlessera/ppt-slide-agent/wiki"