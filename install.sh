#!/bin/bash
cp -v .* $HOME/
cp -rv bin .config .i3 .gnupg $HOME/
if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then git clone git://github.com/gmarik/Vundle.vim $HOME/.vim/bundle/Vundle.vim; fi
