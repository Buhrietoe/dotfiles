#!/bin/bash
filename=Sound/Recorded/record-`date +%y%m%d-%Hh%M%S`.aac
ffmpeg -f oss -i /dev/dsp -acodec libfaac -aq 80 -ar 24000 -y $filename
