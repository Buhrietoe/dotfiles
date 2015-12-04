set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'klen/python-mode.git'

call vundle#end()
filetype plugin indent on

" nerdtree plugin tweak
let g:NERDTreeDirArrows = 0

" python-mode tweaks
let g:pymode_folding = 0
let g:pymode_rope = 0

let mapleader=","
set timeout timeoutlen=1500
set autoindent
set showmatch
set showmode
set showcmd
set smartcase
set visualbell
set modelines=0
set background=dark
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
" set textwidth=80
set ff=unix
set encoding=utf-8
set number
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

" Toggle NERDTree
nnoremap <F2> :NERDTreeToggle<CR>

" Toggle line numbers
nnoremap <F3> :set invnumber<CR>

" Buffer control
nnoremap <C-j> :bnext<CR>
nnoremap <C-k> :bprevious<CR>
nnoremap <C-l> :bdelete<CR>

colorscheme slate
syn on
