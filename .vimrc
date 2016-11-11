set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin manager
Plugin 'gmarik/Vundle.vim'

" Its pretty
Plugin 'vim-airline/vim-airline'
Plugin 'tomasr/molokai'

" Helpers
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'roxma/SimpleAutoComplPop'

" Language specific
Plugin 'klen/python-mode.git'
Plugin 'fatih/vim-go'

call vundle#end()
filetype plugin indent on


" molokai tweaks
let g:rehash256 = 1
let g:molokai_original = 1

" nerdtree plugin tweak
let g:NERDTreeDirArrows = 0

" python-mode tweaks
let g:pymode_folding = 0
let g:pymode_rope = 0

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

let mapleader=","

set timeout timeoutlen=1500
set ttyfast
set ttymouse=xterm2
set ttyscroll=3
set laststatus=2
set autoread
set autowrite
set backspace=indent,eol,start
set incsearch
set autoindent
set showmode
set showcmd
set smartcase
set switchbuf=usetab
set showtabline=2
set visualbell
set modelines=0
set background=dark
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set fileformats=unix,dos,mac
set encoding=utf-8
set number
set hidden
set nobackup
set nowritebackup
set noswapfile
set nowrap
set noerrorbells
set noshowmatch
set completeopt=menu,menuone
set pumheight=10
set gfn=terminus\ 10
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

" Tab specific
nnoremap <C-n> :tabnew<CR>

" Syntax Colors
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai
syn on
