#!/bin/bash
 
ffmpeg -i $1 -vcodec libx264 -acodec libfaac -vpre normal -isync -copyts -aq 80 -threads 0 -qmax 30 -y $2 $1-converted.mp4
