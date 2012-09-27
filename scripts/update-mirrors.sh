#!/bin/sh
sudo reflector -c "United States" -f 5 -p "http" --save /etc/pacman.d/mirrorlist
