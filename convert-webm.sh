#!/bin/bash
 
ffmpeg -i $1 -vcodec libvpx -acodec libvorbis -isync -copyts -aq 80 -threads 3 -y $2 $1-converted.webm
