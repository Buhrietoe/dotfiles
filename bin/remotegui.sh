#!/bin/sh
cp -v ~/bin/xguis/.xinitrc_openbox ~/.xinitrc
startx -- /usr/bin/Xvfb :0 -screen 0 1340x750x24 &
x11vnc -display :0 -ncache 10 -ncache_cr
