#!/bin/sh

if [ -n "$1" ]; then
    FILENAME=$1
    shift 1
else
    echo "Usage: $0 <FILENAME>"
    exit 1
fi

ffmpeg -hwaccel cuda -hwaccel_output_format cuda -i $FILENAME -c:a copy -c:v av1_nvenc -rc:v constqp -y $FILENAME-archive.mp4

# vim: ft=sh
