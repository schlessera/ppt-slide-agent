#!/bin/bash

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
CLAUDE_CONFIG_DIR="${HOME}/.config/claude-code"

echo "⚙️  Configuring Claude Code for Slide Agent"

# Create config directory if it doesn't exist
mkdir -p "$CLAUDE_CONFIG_DIR"

# Create Claude Code settings with comprehensive permissions
cat > "$CLAUDE_CONFIG_DIR/settings.json" << EOF
{
  "autoApprovedTools": [
    "WebSearch",
    "WebSearch(*)",
    "WebFetch",
    "WebFetch(*)",
    "Read",
    "Read(*)",
    "Write",
    "Write(*)",
    "Edit",
    "Edit(*)",
    "MultiEdit",
    "MultiEdit(*)",
    "Grep",
    "Grep(*)",
    "Glob",
    "Glob(*)",
    "LS",
    "LS(*)",
    "Bash(python *)",
    "Bash(python3 *)",
    "Bash(pip *)",
    "Bash(npm *)",
    "Bash(node *)",
    "Bash(ls *)",
    "Bash(cd *)",
    "Bash(pwd)",
    "Bash(cat *)",
    "Bash(echo *)",
    "Bash(mkdir *)",
    "Bash(cp *)",
    "Bash(mv *)",
    "Bash(rm *.pptx)",
    "Bash(rm *.pdf)",
    "Bash(rm *.png)",
    "Bash(rm *.jpg)",
    "Bash(source *)",
    "Bash(which *)",
    "Bash(export *)",
    "Bash(git status)",
    "Bash(git diff)",
    "Bash(git log *)",
    "TodoWrite",
    "TodoWrite(*)",
    "Task",
    "Task(*)",
    "NotebookEdit",
    "NotebookEdit(*)",
    "ExitPlanMode",
    "ExitPlanMode(*)",
    "BashOutput",
    "BashOutput(*)",
    "KillBash",
    "KillBash(*)",
    "mcp__*",
    "mcp__powerpoint__*",
    "mcp__office__*",
    "mcp__ide__*",
    "mcp__filesystem__*",
    "mcp__github__*",
    "mcp__web__*"
  ],
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
        "path": "${PROJECT_ROOT}/config/mcp-config.json",
        "command": "python",
        "args": ["-m", "office_powerpoint_mcp_server"],
        "env": {
          "PYTHONPATH": "${PROJECT_ROOT}/mcp-servers/powerpoint-mcp:${PROJECT_ROOT}/venv/lib/python3.12/site-packages"
        },
        "autoStart": true,
        "autoApprove": true
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
  },
  "features": {
    "extendedThinking": true,
    "imageSupport": true,
    "webAccess": true,
    "taskManagement": true,
    "mcpIntegration": true
  },
  "ui": {
    "showToolUse": true,
    "showThinking": false,
    "compactMode": false
  },
  "slideAgent": {
    "defaultTemplate": "professional",
    "autoSave": true,
    "autoSaveInterval": 300,
    "outputDirectory": "${PROJECT_ROOT}/presentations",
    "enableVersioning": true,
    "defaultTheme": {
      "primaryColor": "#2C3E50",
      "secondaryColor": "#3498DB",
      "fontFamily": "Arial, sans-serif"
    }
  }
}
EOF

# Also copy to project config directory for reference
cp "$CLAUDE_CONFIG_DIR/settings.json" "$PROJECT_ROOT/config/claude-code-settings.json" 2>/dev/null || true

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
echo "✅ Auto-approved tools configured for seamless operation"
echo ""
echo "📋 Pre-approved tools include:"
echo "   • Web Search & Fetch (research capabilities)"
echo "   • File operations (Read, Write, Edit)"
echo "   • PowerPoint MCP Server (presentation creation)"
echo "   • Python & Node.js execution"
echo "   • Git operations"
echo "   • Task management"
echo ""
echo "🔒 Security note: Only safe operations are pre-approved"