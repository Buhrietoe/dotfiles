#!/bin/sh
# vim: ft=sh

#set -x

if [ -n "$1" ]; then
    FIRST=$1
    shift 1
else
    echo "Usage: $0 <FILENAME1> <FILENAME2>"
    exit 1
fi

if [ -n "$1" ]; then
    SECOND=$1
    shift 1
else
    echo "Usage: $0 <FILENAME1> <FILENAME2>"
    exit 1
fi

nice ffmpeg -i "$FIRST" -i "$SECOND" -filter_complex vstack -preset veryfast -c:v h264 -c:a copy -y stack-"$FIRST"-"$SECOND".mp4
