filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin manager
Plugin 'VundleVim/Vundle.vim'

" Its pretty
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-signify'

" Color
Plugin 'tomasr/molokai'

" Helpers
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'roxma/SimpleAutoComplPop'

" Language specific
Plugin 'klen/python-mode'
Plugin 'fatih/vim-go'
Plugin 'Blackrush/vim-gocode'
Plugin 'rust-lang/rust.vim'

call vundle#end()
filetype plugin indent on


" molokai tweaks
let g:rehash256 = 1
let g:molokai_original = 1

" nerdtree plugin tweak
let g:NERDTreeDirArrows = 1

" airline tweaks
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'jellybeans'
let g:airline_powerline_fonts = 1

" python-mode tweaks
let g:pymode_folding = 0
let g:pymode_rope = 0

" vim-go
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>d <Plug>(go-doc)
autocmd FileType go nmap <leader>l <Plug>(go-metalinter)

" SimpleAutoComplPop
autocmd FileType go call sacp#enableForThisBuffer({ "matches": [
    \ { '=~': '\v[a-zA-Z]{2}$' , 'feedkeys': "\<C-x>\<C-n>"} ,
    \ { '=~': '\.$'            , 'feedkeys': "\<Plug>(sacp_cache_fuzzy_omnicomplete)", "ignoreCompletionMode":1} ,
    \ ]})

" vim settings
let mapleader=","
set timeout timeoutlen=1500
set ttyfast
set ttymouse=xterm2
set ttyscroll=3
set clipboard=unnamedplus
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
set modeline
set background=dark
set tabstop=8
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smarttab
set fileformats=unix,dos,mac
set encoding=utf-8
set number
set nohidden
set nobackup
set nowritebackup
set noswapfile
set nowrap
set noerrorbells
set noshowmatch
set completeopt=menu,menuone
set pumheight=10
set guifont=Monospace\ 10
set guioptions=agimrLtT
set ls=2

" Reselect visual block after adjusting indentation
xnoremap < <gv
xnoremap > >gv

" Move around in insert mode
inoremap <C-k> <up>
inoremap <C-j> <down>
inoremap <C-h> <left>
inoremap <C-l> <right>

" Toggle NERDTree
nnoremap <F2> :NERDTreeToggle<CR>

" Toggle line numbers
nnoremap <F3> :set invnumber<CR>

" Tab/Buffer control
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>
nnoremap <C-l> :bdelete<CR>

" Tab specific
nnoremap <C-n> :tabnew<CR>

" Syntax Colors
set t_Co=256
colorscheme molokai
syn on
