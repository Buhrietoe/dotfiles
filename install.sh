#!/bin/bash
cp -v .* ${HOME}/
cp -rv bin .config .i3 .gnupg .atom ${HOME}/
if [ ! -d ${HOME}/.vim/bundle ]; then
    for plugin in $(cat .vimrc | grep "^Plugin" | tr -d "'" | awk '{print $2}'); do
        git clone https://github.com/${plugin} ${HOME}/.vim/bundle/$(basename ${plugin})
    done
fi
