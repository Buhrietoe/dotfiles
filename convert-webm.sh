#!/bin/bash
 
ffmpeg -i $1 -vcodec libvpx -acodec libvorbis -vpre libvpx-360p -isync -copyts -aq 80 -threads 4 -y $2 $1-converted.webm
