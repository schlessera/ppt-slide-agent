FROM ubuntu:22.04

# Prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    nodejs \
    npm \
    git \
    curl \
    wget \
    vim \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Claude Code CLI globally
RUN npm install -g @anthropic/claude-code

# Set working directory
WORKDIR /app

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Install Python dependencies for MCP servers
RUN if [ -d "mcp-servers/powerpoint-mcp" ]; then \
    cd mcp-servers/powerpoint-mcp && \
    pip3 install -e . && \
    cd /app; \
    fi

# Setup Python virtual environment
RUN python3 -m venv venv && \
    . venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# Install Node dependencies for MCP servers
RUN npm install -g \
    @modelcontextprotocol/server-github \
    @modelcontextprotocol/server-filesystem \
    @modelcontextprotocol/server-tavily

# Create necessary directories
RUN mkdir -p \
    /app/presentations \
    /app/templates \
    /app/logs \
    /root/.config/claude-code

# Copy configuration files
COPY config/mcp-config.json /root/.config/claude-code/
COPY CLAUDE.md /app/

# Make scripts executable
RUN chmod +x scripts/*.sh

# Expose ports
EXPOSE 8080 9229 5000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD python3 -c "import sys; sys.exit(0)" || exit 1

# Default command
CMD ["/bin/bash"]