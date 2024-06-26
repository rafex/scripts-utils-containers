#!/bin/sh

_kill_procs() {
  kill -TERM $xvfb
}

# Setup a trap to catch SIGTERM and relay it to child processes
trap _kill_procs SIGTERM

XVFB_WHD=${XVFB_WHD:-1280x720x16}

# Start Xvfb
#Xvfb :99 -ac -screen 0 $XVFB_WHD -nolisten tcp &
Xvfb :99 -screen 0 1024x768x24 +extension GLX +render -noreset >> xsession.log 2>&1 &
xvfb=$!

export DISPLAY=:99

wait $xvfb