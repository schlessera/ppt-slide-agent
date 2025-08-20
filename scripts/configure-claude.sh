#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
CLAUDE_CONFIG_DIR="${HOME}/.config/claude-code"

echo "⚙️  Configuring Claude Code for Slide Agent"

# Create config directory if it doesn't exist
mkdir -p "$CLAUDE_CONFIG_DIR"

# Create Claude Code settings
cat > "$CLAUDE_CONFIG_DIR/settings.json" << EOF
{
  "theme": "dark",
  "editor": {
    "defaultLanguage": "python",
    "tabSize": 2,
    "wordWrap": "on"
  },
  "mcp": {
    "autoConnect": true,
    "servers": {
      "powerpoint": {
        "enabled": true,
        "path": "${PROJECT_ROOT}/config/mcp-config.json"
      }
    }
  },
  "agents": {
    "slide-creator": {
      "enabled": true,
      "path": "${PROJECT_ROOT}/agents/slide-creator.json"
    },
    "content-researcher": {
      "enabled": true,
      "path": "${PROJECT_ROOT}/agents/content-researcher.json"
    },
    "design-optimizer": {
      "enabled": true,
      "path": "${PROJECT_ROOT}/agents/design-optimizer.json"
    }
  },
  "customCommands": {
    "/slide-create": {
      "description": "Create a new presentation",
      "agent": "slide-creator"
    },
    "/slide-research": {
      "description": "Research content for slides",
      "agent": "content-researcher"
    },
    "/slide-optimize": {
      "description": "Optimize slide design and layout",
      "agent": "design-optimizer"
    },
    "/slide-export": {
      "description": "Export presentation in various formats",
      "command": "python ${PROJECT_ROOT}/scripts/export-presentation.py"
    }
  },
  "hooks": {
    "beforeSlideCreate": "${PROJECT_ROOT}/hooks/before-slide-create.sh",
    "afterSlideCreate": "${PROJECT_ROOT}/hooks/after-slide-create.sh",
    "onSlideError": "${PROJECT_ROOT}/hooks/on-slide-error.sh"
  },
  "defaults": {
    "presentationPath": "${PROJECT_ROOT}/presentations",
    "templatePath": "${PROJECT_ROOT}/templates",
    "autoSave": true,
    "autoBackup": true
  }
}
EOF

# Note: Environment template is now in .env.sample in the root directory

# Copy sample to .env if it doesn't exist
if [ ! -f "$PROJECT_ROOT/.env" ]; then
    if [ -f "$PROJECT_ROOT/.env.sample" ]; then
        cp "$PROJECT_ROOT/.env.sample" "$PROJECT_ROOT/.env"
        echo "✅ Created .env file from .env.sample"
        echo "⚠️  Please edit .env to add your API keys (optional)"
    else
        echo "⚠️  No .env.sample found, creating minimal .env"
        cat > "$PROJECT_ROOT/.env" << 'EOF'
# Minimal environment configuration
PPT_OUTPUT_DIR=./presentations
PPT_TEMPLATES_DIR=./templates
PPT_DEFAULT_THEME=professional_blue
PPT_AUTO_SAVE=true
MCP_LOG_LEVEL=info
EOF
    fi
fi

echo "✅ Claude Code configuration complete"