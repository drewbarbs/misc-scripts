#!/bin/bash

# Default to the first device if $1 is unset OR empty string
# http://stackoverflow.com/questions/9332802/how-to-write-a-bash-script-that-takes-optional-input-arguments
MIDISPORT_DEVICE_NUM=${1:-1}

RAWMIDI_PORT=$(amidi -l | grep 'MIDISPORT 2x2 Anniv MIDI' | tr -s ' ' | cut -d' ' -f2 \
    | sed -n "${MIDISPORT_DEVICE_NUM}p");

MIDISPORT_CLIENT_NUM=$(aconnect -lo | grep 'MIDISPORT 2x2 Anniv' | grep client | sed 's/client \([0-9]\+\).*/\1/g')
