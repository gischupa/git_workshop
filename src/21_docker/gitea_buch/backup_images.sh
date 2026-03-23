#!/bin/bash

# Zielordner
TARGET_DIR=~/src/21_docker/images/images_gitea_buch

# Docker-Images
IMAGES=(
  "alpine:3.23.3"
  "gitea/act_runner_dockercli:0.3.0"
  "gitea/gitea:1.22.6"
  "mysql:8"
  "nginx:1.29.6"
)

# Namen der tar-Dateien
TAR_NAMES=(
  "alpine.tar"
  "act_runner.tar"
  "gitea.tar"
  "mysql.tar"
  "nginx.tar"
)

# Sicherstellen, dass der Zielordner existiert
mkdir -p "$TARGET_DIR"

# Durchlaufe jedes Image und erstelle ein tar-File
for i in "${!IMAGES[@]}"; do
  IMAGE="${IMAGES[$i]}"
  TAR_NAME="${TAR_NAMES[$i]}"
  
  echo "Sichere Image: $IMAGE als $TAR_NAME"
  docker save -o "$TARGET_DIR/$TAR_NAME" "$IMAGE"
done

echo "Alle Images wurden erfolgreich gesichert!"
