let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

" Its pretty
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-signify'
Plug 'psliwka/vim-smoothie'

" Color
Plug 'crusoexia/vim-monokai'

" Helpers
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'terryma/vim-multiple-cursors'

" Language specific
"Plug 'klen/python-mode'
"Plug 'fatih/vim-go'
"Plug 'rust-lang/rust.vim'

call plug#end()


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
        call go#test#Test(0, 1)
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
let g:go_gocode_propose_builtins = 1
let g:go_gocode_propose_source = 1
let g:go_gocode_unimported_packages = 1

" supertab
let g:SuperTabDefaultCompletionType = "context"

" youcompleteme
let g:ycm_min_num_of_chars_for_completion = 0

" other
let g:is_bash = 1
let g:sh_no_error= 1

" Filetype specific settings
augroup AutoFileTypes
    autocmd!
    autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
    autocmd FileType go nmap <leader>t <Plug>(go-test)
    autocmd FileType go nmap <leader>r <Plug>(go-run)
    autocmd FileType go nmap <leader>d <Plug>(go-doc)
    autocmd FileType go nmap <leader>l <Plug>(go-metalinter)
    autocmd FileType go setlocal tabstop=4
    autocmd FileType go setlocal omnifunc=go#complete#Complete
    autocmd FileType yaml setlocal shiftwidth=2
augroup END

" vim settings
let mapleader=" "
set timeout timeoutlen=500
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
set redrawtime=5000
set showmode
set showcmd
set smartcase
set switchbuf=usetab
set showtabline=2
set visualbell
set modeline
set background=dark
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set fileformats=unix,dos,mac
set encoding=utf-8
set number
set relativenumber
set scrolloff=10
set sidescrolloff=10
set hidden
set nobackup
set nowritebackup
set noswapfile
set nowrap
set noerrorbells
set noshowmatch
set completeopt=menu,menuone
set pumheight=10
set guifont=Liberation\ Mono\ 10
set guioptions=Pgi
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
nnoremap <leader>e :NERDTreeToggle<CR>

" Toggle line numbers
nnoremap <F3> :set invnumber<CR>

" GTFO
nnoremap <leader>qq :qa<CR>

" Buffer control
nnoremap <S-l> :bn<CR>
nnoremap <S-h> :bp<CR>
nnoremap <leader>bd :bp<CR>:bd #<CR>
nnoremap <C-s> :w<CR>

" Reload vimrc
nnoremap <leader>. :source $MYVIMRC<CR>

" Quote selection
vnoremap <leader>' :s/\%V\(.*\)\%V/"\1"/<CR>

" Convert between yaml and json
function! Y2J()
    if &filetype == 'yaml'
        exec "%!y2j -"
        if v:shell_error == 0
            exec "set filetype=json"
        endif
    elseif &filetype == 'json'
        exec "%!j2y -"
        if v:shell_error == 0
            exec "set filetype=yaml"
        endif
    endif
endfunction
nnoremap <leader>c :call Y2J()<CR>

" Syntax Colors
colorscheme habamax
syn on
