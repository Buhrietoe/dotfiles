#!/bin/bash
cp -r . ${HOME}/
if [ -d /usr/share/xsessions/ ]; then
	sudo cp -v plasma-i3.desktop /usr/share/xsessions/
else
	rm -v ${HOME}/plasma-i3.desktop
fi
rm -rf ${HOME}/install.sh ${HOME}/.git
