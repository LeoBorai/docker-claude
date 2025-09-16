# Docker + Claude

A containerized development environment based on Node.js with modern tooling
and AI-powered coding assistance.

## Overview

This Dockerfile creates a comprehensive development container that includes Node.js runtime, essential development tools, and AI-powered coding capabilities through Claude Code. It's designed to provide a consistent, portable development environment that works across different machines and platforms.

## Features

### Runtime & Package Managers

- **Node.js 24** (Bookworm Slim base)
- **npm** (included with Node.js)
- **Bun** - Fast JavaScript runtime and package manager

### Development Tools

- **git** - Version control
- **curl** - HTTP client and file transfer
- **ripgrep** (`rg`) - Ultra-fast text search
- **fd-find** (`fd`) - Fast file finder
- **jq** - JSON processor
- **tree** - Directory structure visualization
- **bat** - Syntax-highlighted file viewer
- **htop** - Interactive process monitor
- **unzip** - Archive extraction

### AI-Powered Development

- **Claude Code** - AI assistant for coding tasks directly from the command line

### Security & Permissions

- Runs as non-root user (`node`) for security
- Configurable user ID/group ID for file permission compatibility
- Sudo access configured for the development user

## Requirements

- Docker or compatible container runtime
- For Claude Code: Anthropic API key (set via environment variables)

## Usage

Add the following `docker-compose.dev.yml` to your project:

```yml
services:
  claude:
    image: 'ghcr.io/leoborai/docker-claude:latest'
    volumes:
      - ../:/workspaces/dev
    command: sleep infinity
```

Then run the Docker Compose file:

```bash
docker compose -f ./dev/docker-compose.dev.yml up --build --detach
```

Finally _exec_ into the running container:

```bash
docker exec -it <container_id> bash
```

Claude will be available as `claude` command in the terminal.

## Notes

- The container runs as a non-root user for security
- All development tools are pre-installed and ready to use
- The image is optimized for size by cleaning apt cache after installation
- Sudo access is available for installing additional packages if needed
