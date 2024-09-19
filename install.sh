#!/usr/bin/env bash
cp -r . ${HOME}/
if [ -d /usr/share/xsessions/ ]; then
    sudo mv -v plasma-i3.desktop /usr/share/xsessions/
else
    rm -v ${HOME}/plasma-i3.desktop
fi
rm -rf ${HOME}/install.sh ${HOME}/.git
