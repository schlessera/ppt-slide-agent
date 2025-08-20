# 🎯 PPT Slide Agent for Claude Code

A powerful PowerPoint presentation creation system built specifically for Claude Code, featuring MCP integration, intelligent agents, and automated export capabilities.

## ✨ Features

- **🤖 AI-Powered Creation**: Create professional presentations using natural language
- **🔬 Intelligent Research**: Automatic topic research and content gathering
- **🎨 Design Optimization**: Smart design improvements and visual enhancements
- **📤 Multi-Format Export**: Export to PPTX, PDF, PNG, and Markdown with images
- **🗣️ Speaker Notes**: Automatic generation of comprehensive speaker notes
- **🖼️ Visual Documentation**: Generate markdown overviews with slide images

## 🚀 Quick Start

### One-Line Installation

```bash
curl -fsSL https://raw.githubusercontent.com/schlessera/ppt-slide-agent/main/install.sh | bash
```

### Manual Installation

```bash
git clone https://github.com/schlessera/ppt-slide-agent.git
cd ppt-slide-agent
./install.sh
```

## 📚 Usage

### Start Claude Code
```bash
cd ~/ppt-slide-agent
claude code
```

### Available Commands

| Command | Description | Example |
|---------|-------------|---------|
| `/slide-create` | Create a new presentation | `/slide-create "AI in Healthcare"` |
| `/slide-research` | Research a topic | `/slide-research "Quantum Computing"` |
| `/slide-optimize` | Optimize presentation design | `/slide-optimize presentation.pptx` |
| `/slide-export` | Export to multiple formats | `/slide-export latest` |

## 🏗️ Architecture

### Claude Code Structure
```
.claude/
├── settings.json       # Project settings and permissions
├── commands/          # Custom slash commands
│   ├── slide-create.md
│   ├── slide-research.md
│   ├── slide-optimize.md
│   └── slide-export.md
└── agents/           # Specialized sub-agents
    ├── slide-creator.md
    ├── content-researcher.md
    └── design-optimizer.md
```

### MCP Integration
- **Server**: FastMCP-based pptx-mcp server
- **Tools**: 11+ PowerPoint manipulation tools
- **Auto-Export**: Hooks for automatic markdown generation

## 🛠️ Configuration

### Environment Variables (.env)
```bash
# MCP Server
PPTX_HOST=127.0.0.1
PPTX_PORT=8000

# Optional API Keys
OPENAI_API_KEY=        # For GPT features
ANTHROPIC_API_KEY=     # For Claude API
TAVILY_API_KEY=        # For web search
GITHUB_TOKEN=          # For templates
```

### MCP Configuration (.mcp.json)
The MCP server is configured to run locally with automatic startup when Claude Code launches.

## 📦 Components

### Sub-Agents
- **slide-creator**: Main presentation creation agent
- **content-researcher**: Research and information gathering
- **design-optimizer**: Visual design and layout optimization

### Export Features
- **PPTX**: Native PowerPoint format
- **PDF**: Universal document format
- **PNG**: Individual slide images
- **Markdown**: Documentation with embedded images

## 🔧 Prerequisites

- **Python 3.8+**: Required for MCP server
- **Node.js 18+**: Required for Claude Code
- **Claude Code CLI**: Installed automatically if missing
- **LibreOffice**: Optional, for image generation

## 📖 Documentation

### Creating Presentations
```
/slide-create "Your Topic"
```
The agent will:
1. Research the topic
2. Create an outline
3. Generate slides with content
4. Apply professional design
5. Add speaker notes
6. Export with documentation

### Exporting Presentations
```
/slide-export latest
```
Generates:
- PPTX file
- PDF version
- PNG images of each slide
- Markdown overview with images

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

MIT License - see LICENSE file for details

## 🐛 Troubleshooting

### Common Issues

**LibreOffice not found**
```bash
# Ubuntu/Debian
sudo apt install libreoffice

# macOS
brew install libreoffice
```

**MCP Server not starting**
- Check `.mcp.json` configuration
- Verify Python environment
- Check port availability (8000)

**Permission errors**
- Review `.claude/settings.json`
- Check file permissions
- Ensure proper directory access

## 🔗 Links

- [Claude Code Documentation](https://docs.anthropic.com/claude-code)
- [MCP Protocol](https://modelcontextprotocol.io)
- [Issue Tracker](https://github.com/schlessera/ppt-slide-agent/issues)

## 🙏 Acknowledgments

- Based on [pptx-mcp](https://github.com/samos123/pptx-mcp) by samos123
- Built for [Claude Code](https://www.anthropic.com/claude-code) by Anthropic
- Uses [python-pptx](https://python-pptx.readthedocs.io/) for PowerPoint manipulation

---

**Made with ❤️ for Claude Code users**