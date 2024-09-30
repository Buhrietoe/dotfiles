#!/usr/bin/env sh

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
if [ -z "$1" ]; then
    CHOICE="startxfce4"
else
    CHOICE="$1"
fi

exec $CHOICE
