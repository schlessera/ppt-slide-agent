# Security Policy

## Environment Variables and Credentials

This repository follows security best practices:

### ✅ What's Safe
- `.env.sample` - Template file with empty values (committed to repo)
- All configuration files use environment variable references
- No hardcoded credentials anywhere in the codebase

### ⚠️ Never Commit
- `.env` - Your actual environment file with real credentials
- Any file containing API keys or tokens
- Private keys or certificates

### 🔐 Setup Instructions

1. **Copy the sample file:**
   ```bash
   cp .env.sample .env
   ```

2. **Add your credentials to `.env`:**
   - This file is gitignored and will never be committed
   - All credentials are optional - the system works without them

3. **Keep credentials secure:**
   - Never share your `.env` file
   - Rotate API keys regularly
   - Use minimal permissions for tokens

## Reporting Security Issues

If you discover a security vulnerability, please:
1. **DO NOT** create a public issue
2. Email security concerns to the repository maintainer
3. Allow time for the issue to be addressed before disclosure

## API Key Requirements

All API keys are **OPTIONAL**. The system provides basic functionality without them:

| Service | Required For | Fallback |
|---------|-------------|----------|
| ANTHROPIC_API_KEY | Direct Claude API calls | Use Claude Code built-in |
| OPENAI_API_KEY | Additional AI features | Disabled |
| TAVILY_API_KEY | Web search | Manual research |
| GITHUB_TOKEN | Private template repos | Public repos only |

## Best Practices

1. **Minimal Permissions**: When creating tokens, use the minimum required scopes
2. **Environment Isolation**: Use different `.env` files for development/production
3. **Regular Audits**: Review and rotate credentials periodically
4. **Docker Security**: Use secrets management in production Docker deployments