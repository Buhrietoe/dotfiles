#!/bin/sh

if [ -n "$1" ]; then
    FILENAME=$1
    shift 1
else
    echo "Usage: $0 <FILENAME>"
    exit 1
fi

#ffmpeg -vaapi_device /dev/dri/renderD128 -i $FILENAME -c:a copy -vf 'format=nv12,hwupload' -c:v av1_vaapi -rc constqp -q 28 -f mp4 -t 20 -y $FILENAME-archive.mp4
# Vulkan backend is faster and more energy efficient that vaapi with my  AMD strix-halo testing (gfx1151)
ffmpeg -init_hw_device 'vulkan=vk:0' -hwaccel vulkan -hwaccel_output_format vulkan -i $FILENAME -c:a copy -vf 'format=vulkan,hwupload' -c:v av1_vulkan -rc constqp -qp 80 -f mp4 -y $FILENAME-archive.mp4

# vim: ft=sh
