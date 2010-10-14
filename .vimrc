version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
map! <S-Insert> <MiddleMouse>
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
map <S-Insert> <MiddleMouse>
let &cpo=s:cpo_save
unlet s:cpo_save
set backspace=indent,eol,start
set fileencodings=ucs-bom,utf-8,default,latin1
set helplang=en
set history=50
set mouse=a
set ruler
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set termencoding=utf-8
" vim: set ft=vim :
set smartindent
set showmatch
set background=dark
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set ff=unix
set nu
set hidden
set backupdir=/tmp
set directory=/tmp
set gfn=Monospace\ 10
set ls=2
nmap <C-j> :bn<CR>
nmap <C-k> :bp<CR>
nmap <C-l> :ls<CR>
nmap <C-h> :bd<CR>
nmap <C-m> :set lines=32<CR>:set columns=113<CR>
nmap <C-n> :set lines=24<CR>:set columns=80<CR>
color torte
syn on
