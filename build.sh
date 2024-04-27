#!/bin/sh

source scripts-utils/valid_podman.sh
source scripts-utils/color_message.sh
source scripts-utils/date.sh

REPOSITORY=image-${current_millis}
TAG=v0.1.0
DOCKERFILE=Dockerfile

ROOT_DIR=$(pwd)

color_message "cyan" "Building image..."
color_message "yellow" "Repository: $REPOSITORY"
color_message "yellow" "Tag: $TAG"
color_message "yellow" "Dockerfile: $DOCKERFILE"

# docker build --progress=plain --no-cache -t $REPOSITORY:$TAG -f $DOCKERFILE .
