#!/bin/sh

VERSION_SCRIPT=0.1.0
PWD=$(pwd)
#export PATH_MY_SCRIPT=$PWD

if [ -z "$PATH_MY_SCRIPT" ]; then
    echo "La variable no está definida o está vacía."
    PATH_MY_SCRIPT=$PWD
#else
#    echo "La variable está definida con el valor: $PATH_MY_SCRIPT"
fi

source ${PATH_MY_SCRIPT}/scripts-utils/valid_podman.sh
source ${PATH_MY_SCRIPT}/scripts-utils/color_message.sh
source ${PATH_MY_SCRIPT}/scripts-utils/date.sh
source ${PATH_MY_SCRIPT}/scripts-utils/debug_message.sh

REPOSITORY=image-${current_millis}
TAG=v0.1.0
DOCKERFILE=Dockerfile
ROOT_DIR=$(pwd)
DEBUG=false

color_message "green" "Building image script"

# Function to display help text
usage() {
  color_message "cyan" "Usage: $0 [-v] [-V] [-n] [-t] [-d] [-D] [-h]"
  color_message "cyan" "Options:"
  color_message "cyan" "  -v          Display version."
  color_message "cyan" "  -V          Enable Verbose mode."
  color_message "cyan" "  -n          Name image."
  color_message "cyan" "  -t          Tag image."
  color_message "cyan" "  -d          Dockerfile"
  color_message "cyan" "  -D          Debug mode"
  color_message "cyan" "  -h          Display the help message"
}

# docker build --progress=plain --no-cache -t $REPOSITORY:$TAG -f $DOCKERFILE .

# Parse options using getopts
while getopts ":vVn:t:d:Dh" option; do
    case "${option}" in
        v)  # Version option
            echo "Version: $VERSION_SCRIPT"
            ;;
        V)  # Verbose option
            echo "Verbose mode activated."
            DEBUG=true
            ;;
        n)  # Name option
            REPOSITORY=${OPTARG}
            ;;
        t)  # Tag option
            TAG=${OPTARG}
            ;;
        d)  # Dockerfile option
            DOCKERFILE=${OPTARG}
            ;;
        D)  # Debug option
            DEBUG=true
            ;;
        h)  # Help option
            usage
            exit 0
            ;;
        \?) # Invalid option
            echo "Invalid option: -$OPTARG"
            usage
            exit 1
            ;;
    esac
done
shift $(($OPTIND - 1))
color_message "red" "Remaining arguments are: $*"

variables () {
  color_message "cyan" "Building image..."
  color_message "yellow" "Repository: $REPOSITORY"
  color_message "yellow" "Tag: $TAG"
  color_message "yellow" "Dockerfile: $DOCKERFILE"
}

variables

if [ "$DEBUG" = true ]; then
  color_message "red" "Debug mode activated."
  eval_command "docker build --progress=plain --no-cache -t $REPOSITORY:$TAG -f $DOCKERFILE ." $DEBUG
else
  docker build -t $REPOSITORY:$TAG -f $DOCKERFILE .
fi