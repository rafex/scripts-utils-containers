#!/bin/sh

current_millis=0

date --version > /dev/null 2>&1 && {
    # GNU date is available
    current_millis=$(($(date +%s%N) / 1000000))
} || {
    # Fallback to BSD date
    current_millis=$(($(date +%s) * 1000))
}

echo "Fecha y hora actual en milisegundos: $current_millis"