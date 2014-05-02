set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'

call vundle#end()
filetype plugin indent on

set smartindent
set showmatch
set showmode
set showcmd
set smartcase
set visualbell
set modelines=0
set background=dark
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set ff=unix
set encoding=utf-8
set nu
set hidden
set nobackup
set nowritebackup
set noswapfile
set gfn=Monospace\ 10
set ls=2

" Reselect visual block after adjusting indentation
vnoremap < <gv
vnoremap > >gv

" Move around in insert mode
inoremap <C-k> <up>
inoremap <C-j> <down>
inoremap <C-h> <left>
inoremap <C-l> <right>

color peachpuff
syn on
