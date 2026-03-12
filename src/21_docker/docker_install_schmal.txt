#!/bin/bash

set -e
set -x

apt update

apt install -y \
    apt-transport-https \
    curl


# --------------------------------------------------
# Docker GPG Key
# --------------------------------------------------

curl -fsSL \
    https://download.docker.com/linux/ubuntu/gpg \
  | gpg --dearmor \
      -o /etc/apt/keyrings/docker.gpg


# --------------------------------------------------
# Docker Repository
# --------------------------------------------------

ARCH=$(dpkg --print-architecture)
CODENAME=$(
    . /etc/os-release
    echo "$VERSION_CODENAME"
)

echo "deb [arch=${ARCH} \
signed-by=/etc/apt/keyrings/docker.gpg] \
https://download.docker.com/linux/ubuntu \
${CODENAME} stable" \
| tee /etc/apt/sources.list.d/docker.list \
> /dev/null


apt update


# --------------------------------------------------
# Docker Engine + Plugins
# --------------------------------------------------

apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin


# --------------------------------------------------
# Standalone Docker Compose Binary
# --------------------------------------------------

COMPOSE_BASE_URL="https://github.com/docker/compose/releases/download"
COMPOSE_VERSION="1.28.5"

curl -L \
    ${COMPOSE_BASE_URL}/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m) \
    -o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose
