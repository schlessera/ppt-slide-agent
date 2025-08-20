# 🎯 PPT Slide Agent - AI-Powered PowerPoint Creator

**One-line setup for an intelligent PowerPoint presentation system powered by Claude Code and MCP servers.**

🔗 **Repository:** [github.com/schlessera/ppt-slide-agent](https://github.com/schlessera/ppt-slide-agent)

## ✨ Features

- 🤖 **AI-Driven Creation** - Natural language to professional presentations
- 🔌 **MCP Integration** - Direct PowerPoint manipulation via Model Context Protocol
- 🎨 **Smart Design** - Automatic layout optimization and theme application
- 🔍 **Content Research** - Built-in web research for accurate, relevant content
- 📊 **Data Visualization** - Automatic chart and graph generation
- 🎯 **Custom Agents** - Specialized agents for creation, research, and design
- 🚀 **One-Line Install** - Get started in seconds

## 🚀 Quick Start

### One-Line Installation

```bash
curl -fsSL https://raw.githubusercontent.com/schlessera/ppt-slide-agent/main/install.sh | bash
```

Or clone and setup:

```bash
git clone https://github.com/schlessera/ppt-slide-agent.git
cd ppt-slide-agent
bash scripts/setup.sh
```

### First Presentation

```bash
# Start Claude Code
claude code

# Create your first presentation
/slide-create "Introduction to Quantum Computing"
```

## 📋 Prerequisites

- **OS**: Ubuntu, WSL, or Linux
- **Claude Code**: CLI installed (`npm install -g @anthropic/claude-code`)
- **Python**: 3.8+ 
- **Node.js**: 16+

The installer will check and install missing dependencies automatically.

## 🎮 Usage

### Basic Commands

| Command | Description |
|---------|-------------|
| `/slide-create [topic]` | Create a new presentation |
| `/slide-research [topic]` | Research content for slides |
| `/slide-optimize` | Optimize design and layout |
| `/slide-export [format]` | Export to PDF, images, etc. |
| `/slide-theme [name]` | Apply presentation theme |

### Example Workflows

#### 1. Quick Business Presentation
```bash
/slide-create "Q4 2024 Sales Report"
# AI researches data, creates slides, applies corporate theme
```

#### 2. Academic Presentation with Research
```bash
/slide-research "Climate Change Impact on Ocean Acidification"
/slide-create --use-research
/slide-optimize
```

#### 3. Custom Theme Application
```bash
/slide-create "Product Launch 2025"
/slide-theme corporate-blue
/slide-add "Market Analysis" --data market-data.csv
```

## 🏗️ Architecture

```
slide-agent/
├── agents/              # Custom AI agents
│   ├── slide-creator.json
│   ├── content-researcher.json
│   └── design-optimizer.json
├── config/              # Configuration files
│   └── mcp-config.json
├── hooks/               # Event hooks
│   ├── before-slide-create.sh
│   └── after-slide-create.sh
├── mcp-servers/         # MCP server implementations
│   └── powerpoint-mcp/
├── templates/           # Presentation templates
│   ├── professional/
│   ├── academic/
│   └── creative/
├── scripts/             # Setup and utility scripts
└── presentations/       # Output directory
```

## ⚙️ Configuration

### Environment Variables

1. **Copy the sample environment file:**
```bash
cp .env.sample .env
```

2. **Edit `.env` and add your API keys (all optional):**
```bash
# API Keys for enhanced features (all optional)
ANTHROPIC_API_KEY=    # For Claude API access
OPENAI_API_KEY=       # For additional AI features
TAVILY_API_KEY=       # For web search capabilities
GITHUB_TOKEN=         # For accessing template repositories

# PowerPoint Settings (defaults work fine)
PPT_DEFAULT_THEME=professional_blue
PPT_AUTO_SAVE=true
PPT_AUTO_BACKUP=true

# Slide Agent Settings
SLIDE_AGENT_AUTO_RESEARCH=true
SLIDE_AGENT_AUTO_DESIGN=true
```

**Note:** All API keys are optional. The system works without them but some features may be limited.

### Custom Agents

Modify agent behavior in `agents/` directory:
- `slide-creator.json` - Presentation creation logic
- `content-researcher.json` - Research capabilities
- `design-optimizer.json` - Design improvements

## 🔧 Advanced Features

### Custom Hooks

Add automation with hooks:

```bash
# hooks/before-slide-create.sh
#!/bin/bash
echo "Creating presentation: $1"
# Custom logic here
```

### Template Creation

Add custom templates in `templates/` directory following the structure:
```
templates/custom-theme/
├── theme.json
├── layouts/
├── styles/
└── assets/
```

### MCP Server Extensions

Extend capabilities by adding MCP servers in `config/mcp-config.json`.

## 🐳 Docker Support

Run in an isolated environment:

```bash
docker-compose up
docker exec -it slide-agent claude code
```

## 📚 Documentation

- [Installation Guide](docs/installation.md)
- [Custom Agents](docs/agents.md)
- [MCP Server Setup](docs/mcp-setup.md)
- [Template Creation](docs/templates.md)
- [API Reference](docs/api.md)

## 🤝 Contributing

Contributions welcome! Please read our [Contributing Guide](CONTRIBUTING.md).

## 📄 License

MIT License - See [LICENSE](LICENSE) file.

## 🆘 Support

- **Issues**: [GitHub Issues](https://github.com/schlessera/ppt-slide-agent/issues)
- **Discussions**: [GitHub Discussions](https://github.com/schlessera/ppt-slide-agent/discussions)
- **Documentation**: [Wiki](https://github.com/schlessera/ppt-slide-agent/wiki)

## 🌟 Acknowledgments

- [Claude Code](https://claude.ai/code) - AI coding assistant
- [Model Context Protocol](https://modelcontextprotocol.io) - MCP specification
- [python-pptx](https://python-pptx.readthedocs.io) - PowerPoint manipulation

---

**Built with ❤️ for presenters who value their time**