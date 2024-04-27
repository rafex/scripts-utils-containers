#!/bin/sh

# Debug messages

function debug_message() {
  local MESSAGE=$1
  local DEBUG=$2

  if [ "$DEBUG" == "true" ]; then
    echo -e "\033[0;31mDEBUG: [$MESSAGE]\033[0m" 
  fi
}

function warning_message() {
  local MESSAGE=$1
  local DEBUG=$2

  if [ "$DEBUG" == "true" ]; then
    echo -e "\033[0;33mDEBUG: [$MESSAGE]\033[0m" 
  fi
}

#debug_message "This is a debug message" "true"

# function eval text command
function eval_command() {
  local COMMAND=$1
  local DEBUG=$2

  debug_message "Evaluating command: $COMMAND" $DEBUG

  if [ "$DEBUG" == "true" ]; then
    warning_message "Evaluating command: $COMMAND"
  fi

  local RESULT=$(eval $COMMAND)

  debug_message "Result of the command: $RESULT" $DEBUG

  if [ "$DEBUG" == "true" ]; then
    warning_message "Result of the command: $RESULT"
  fi

  #echo "$RESULT"
}

#eval_text_command "This is a text" "echo $TEXT" "true"
#eval_text_command "This is a text" "echo $TEXT" "false"
#!/bin/sh

# This script is used to color the messages in the terminal
