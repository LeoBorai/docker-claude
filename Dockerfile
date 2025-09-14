FROM node:24-bookworm-slim

RUN apt-get update && apt-get install -y \
    git \
    curl \
    sudo \
    ca-certificates \
    ripgrep \
    fd-find \
    jq \
    tree \
    bat \
    htop \
    unzip \
    && rm -rf "/var/lib/apt/lists/*"

# Install Bun
RUN curl -fsSL https://bun.sh/install | bash

# Install Claude Code
RUN npm install -g @anthropic-ai/claude-code

ARG USERNAME=node
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN groupmod --gid $USER_GID $USERNAME \
    && usermod --uid $USER_UID --gid $USER_GID $USERNAME \
    && chown -R $USER_UID:$USER_GID /home/$USERNAME

RUN echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

RUN mkdir -p /workspaces/dev
WORKDIR /workspaces/dev

USER $USERNAME
