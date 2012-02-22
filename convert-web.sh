#!/bin/bash
 
ffmpeg -i $1 -vcodec libx264 -acodec libmp3lame -isync -copyts -ab 64k -threads 0 -qmax 40 -y $2 $1-converted.mp4
