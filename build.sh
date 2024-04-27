#!/bin/sh

source scripts-utils/valid_podman.sh
source scripts-utils/color_message.sh

ROOT_DIR=$(pwd)

color_message "cyan" "Building image..."
