#!/bin/bash
mplayer tv:// -tv driver=v4l2:width=352:height=288:device=/dev/video0 -fps 30
