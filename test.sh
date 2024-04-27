#!/bin/sh

VERSION_SCRIPT=0.1.0

# Function to display help text
usage() {
    echo "Usage: $0 [-v] [-V] [-f] [-h]"
    echo "Options:"
    echo "  -v          Display version."
    echo "  -V          Enable Verbose mode."
    echo "  -f          Continue force execution."
    echo "  -h          Display the help message"
}

# Parse options using getopts
while getopts ":vVfh" option; do
    case "${option}" in
        v)  echo "Version: $VERSION_SCRIPT"
            ;;
        V)  echo "Verbose mode activated."
            ;;
        f)  echo "Force execution confirmed."
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