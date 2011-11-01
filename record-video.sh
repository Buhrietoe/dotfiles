#!/bin/bash

mkdir ~/videos
filename=~/videos/webcam-`date +%y%m%d-%Hh%M%S`.avi
ffmpeg -f video4linux2 -i /dev/video0 -vcodec rawvideo -isync -copyts -y $filename
