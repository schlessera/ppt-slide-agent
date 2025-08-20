#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "📝 Creating CLAUDE.md project instructions..."

# Check if CLAUDE.md already exists
if [ -f "$PROJECT_ROOT/CLAUDE.md" ]; then
    echo "✅ CLAUDE.md already exists"
else
    echo "❌ CLAUDE.md not found, creating from template"
    # Copy from template or create new
    cp "$SCRIPT_DIR/../CLAUDE.md" "$PROJECT_ROOT/CLAUDE.md" 2>/dev/null || \
    cat > "$PROJECT_ROOT/CLAUDE.md" << 'EOF'
# Slide Agent - Claude Code Instructions

You are operating within the Slide Agent system, a specialized environment for creating professional PowerPoint presentations.

## Primary Commands
- `/slide-create [topic]` - Create new presentation
- `/slide-research [topic]` - Research content
- `/slide-optimize` - Optimize design
- `/slide-export [format]` - Export presentation

## Available MCP Servers
- PowerPoint Server - Full presentation manipulation
- FileSystem Server - Template management
- GitHub Server - Template repository
- Web Search Server - Content research

## Workflow
1. Research → Outline → Create → Design → Review

## Best Practices
- One key idea per slide
- 6-8 lines of text maximum
- High-quality visuals
- Consistent styling
- Speaker notes for context

Remember: Quality over quantity.
EOF
fi

echo "✅ CLAUDE.md instructions ready"