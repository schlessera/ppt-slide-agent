# Claude Code Permissions Configuration

## Overview

The Slide Agent comes with pre-configured permissions to ensure a seamless experience without manual approval prompts for common operations.

## Pre-Approved Tools

The following tools are automatically approved when you install Slide Agent:

### Web Operations
- **WebSearch** - Search the web for research content
- **WebFetch** - Fetch and analyze web pages

### File Operations
- **Read** - Read any file in the project
- **Write** - Create new files
- **Edit** - Modify existing files
- **MultiEdit** - Make multiple edits efficiently
- **LS** - List directory contents
- **Glob** - Find files by pattern
- **Grep** - Search file contents

### Development Tools
- **Python execution** - Run Python scripts
- **Node.js execution** - Run JavaScript/Node scripts
- **Package managers** - pip, npm operations
- **Git operations** - status, diff, log

### Presentation Tools
- **PowerPoint MCP Server** - All PowerPoint operations
- **Task management** - TodoWrite for tracking tasks
- **Notebook editing** - For Jupyter notebooks

### MCP Servers
All MCP server tools are pre-approved with the pattern `mcp__*`:
- `mcp__powerpoint__*` - PowerPoint operations
- `mcp__office__*` - Office suite operations
- `mcp__filesystem__*` - File system operations
- `mcp__github__*` - GitHub integration
- `mcp__web__*` - Web operations

## Security Considerations

### What's Approved
- Safe file operations (read, write, edit)
- Controlled bash commands (Python, Node, package managers)
- Research tools (web search, fetch)
- Presentation-specific operations

### What's NOT Approved
- System-level commands (sudo, rm -rf, etc.)
- Sensitive file access outside project
- Database operations
- Network configuration changes

## Customizing Permissions

To modify permissions, edit the `autoApprovedTools` section in:
- Global: `~/.config/claude-code/settings.json`
- Project: `./config/claude-code-settings.json`

### Adding New Permissions

```json
{
  "autoApprovedTools": [
    "YourNewTool",
    "YourNewTool(*)",
    "Bash(your-command *)"
  ]
}
```

### Pattern Matching

- `Tool` - Exact tool name
- `Tool(*)` - Tool with any parameters
- `Tool(prefix*)` - Tool with parameters starting with prefix
- `mcp__*` - All MCP server tools

## Troubleshooting

### Permission Denied
If you encounter permission prompts:
1. Check if the tool is in the approved list
2. Add it to `autoApprovedTools` if safe
3. Restart Claude Code

### MCP Server Access
MCP servers should auto-connect with:
```json
{
  "mcp": {
    "servers": {
      "powerpoint": {
        "autoStart": true,
        "autoApprove": true
      }
    }
  }
}
```

## Best Practices

1. **Review permissions** periodically
2. **Don't approve wildcards** for sensitive operations
3. **Use specific patterns** when possible
4. **Keep project permissions** separate from global

## Environment Variables

Some permissions depend on environment configuration:
- `PPT_OUTPUT_DIR` - Where presentations are saved
- `MCP_LOG_LEVEL` - Logging verbosity
- API keys for external services

## Support

For permission-related issues:
1. Check `~/.config/claude-code/settings.json`
2. Verify MCP server configuration
3. Review Claude Code logs
4. Report issues at: https://github.com/schlessera/ppt-slide-agent/issues