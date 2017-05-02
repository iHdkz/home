".vimrc file.
filetype plugin on
filetype indent on

syntax on
colorscheme mycolor "located at $HOME/.vim/after/colors/mycolor.vim

set nocompatible number
"set cursorline
set autoindent smartindent
set autowrite backup writebackup
set nostartofline showmatch
set incsearch ignorecase smartcase wrapscan hlsearch
set helpheight=10 cmdheight=1

set wildmenu wildmode=list:longest,full
set history=1000

set clipboard=unnamed,unnamedplus

set statusline=[%n]\ %f\ %(\ %M%R%H!%)[%{&fileformat}][%{&fileencoding}]
set statusline+=<r=%l\,c=%c%V>\ ASCII=%b\ HEX=%B
set laststatus=2
set showcmd showmode

if &encoding !=# 'utf-8' | set encoding=japan fileencoding=japan | endif

noremap j	gj
noremap k	gk
noremap <Down> g<Down>
noremap <Up>   g<Up>

"for searching
nnoremap n  nzz
nnoremap N  Nzz
nnoremap *  *zz
nnoremap #  #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap <ESC><ESC> :nohlsearch<ESC>
