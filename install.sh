#!/bin/sh
cp -v .* ~/
cp -rv scripts .config .vim ~/
git clone git://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
