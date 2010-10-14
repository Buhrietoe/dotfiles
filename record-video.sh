#!/bin/bash
filename=Videos/Webcam/webcam-`date +%y%m%d-%Hh%M%S`.mpg
ffmpeg -f oss -i /dev/dsp -f video4linux2 -i /dev/video0 -s cif -r 30 -b 4096k -y $filename
