#!/bin/sh
# vim: ft=sh

#set -x

if [ -n "$1" ]; then
    FILENAME=$1
    shift 1
else
    echo "Usage: $0 <FILENAME> [0..2 for optzoom]"
    exit 1
fi

if [ -n "$1" ]; then
    OPT=$1
    shift 1
else
    OPT=0
fi

TRANSFORM="$FILENAME.trf"

if [ ! -f $TRANSFORM ]; then
    nice ffmpeg -i "$FILENAME" -vf vidstabdetect=shakiness=10:stepsize=1:accuracy=15:mincontrast=0.1:result="$TRANSFORM" -f NULL -
fi

case "$OPT" in
    "0") nice ffmpeg -i "$FILENAME" -vf vidstabtransform=smoothing=50:input="$TRANSFORM":optzoom=0:crop=black,unsharp=5:5:1:3:3:1 -c:v h264 -preset veryfast -crf 23 "$@" -y "$FILENAME"-stabilized.mp4;;
    "1") nice ffmpeg -i "$FILENAME" -vf vidstabtransform=smoothing=50:input="$TRANSFORM":optzoom=1:zoom=5:crop=black,unsharp=5:5:1:3:3:1 -c:v h264 -preset veryfast -crf 23 "$@" -y "$FILENAME"-stabilized.mp4;;
    "2") nice ffmpeg -i "$FILENAME" -vf vidstabtransform=smoothing=50:input="$TRANSFORM":optzoom=2:zoomspeed=0.1:crop=black,unsharp=5:5:1:3:3:1 -c:v h264 -preset veryfast -crf 23 "$@" -y "$FILENAME"-stabilized.mp4;;
    *) echo Optzoom must be 0 to 2; exit 1;;
esac
