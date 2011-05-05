#!/bin/bash
filename=videos/Webcam/webcam-`date +%y%m%d-%Hh%M%S`.mp4
ffmpeg -f oss -i /dev/dsp -f video4linux2 -i /dev/video0 -vcodec libx264 -acodec libfaac -vpre superfast -isync -copyts -aq 80 -threads 0 -qmax 30 -y $filename
