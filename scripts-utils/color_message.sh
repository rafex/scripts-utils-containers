#!/bin/sh

# This script is used to color the messages in the terminal
# Author: @rafex (Raúl González)

function color_message() {
  local color=$1
  local message=$2

  case $color in
    "red")
      echo -e "\033[0;31m$message\033[0m"
      ;;
    "green")
      echo -e "\033[0;32m$message\033[0m"
      ;;
    "yellow")
      echo -e "\033[0;33m$message\033[0m"
      ;;
    "blue")
      echo -e "\033[0;34m$message\033[0m"
      ;;
    "purple")
      echo -e "\033[0;35m$message\033[0m"
      ;;
    "cyan")
      echo -e "\033[0;36m$message\033[0m"
      ;;
    "white")
      echo -e "\033[0;37m$message\033[0m"
      ;;
    *)
      echo -e "\033[0;37m$message\033[0m"
      ;;
  esac
}
