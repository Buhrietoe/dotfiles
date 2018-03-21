#!/bin/bash
cp -r . ${HOME}/
rm -rf ${HOME}/install.sh ${HOME}/.git
if [ ! -d ${HOME}/.vim/bundle ]; then
    for plugin in $(cat .vimrc | grep "^Plugin" | tr -d "'" | awk '{print $2}'); do
        git clone https://github.com/${plugin} ${HOME}/.vim/bundle/$(basename ${plugin})
    done
    push ${HOME}/.vim/bundle/YouCompleteMe
    ./install.py --go-completer
    pop
fi
