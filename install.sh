#!/bin/sh
cp -v .* ~/
cp -rv bin .config .i3 ~/
git clone git://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
git clone git://github.com/scrooloose/nerdtree ~/.vim/bundle/nerdtree
git clone git://github.com/scrooloose/syntastic ~/.vim/bundle/syntastic
