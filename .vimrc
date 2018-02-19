".vimrc file.
filetype plugin on
filetype indent on
syntax on
colorscheme mycolor "located at $HOME/.vim/after/colors/mycolor.vim

set nocompatible autoindent smartindent number " cursorline
set nostartofline showmatch autowrite backup writebackup
set incsearch ignorecase smartcase wrapscan hlsearch
set helpheight=10 cmdheight=1 history=1000
set wildmenu wildmode=list:longest,full
set clipboard=unnamed,unnamedplus

set statusline=[%n]\ %f\ %(\ %M%R%H!%)[%{&fileformat}][%{&fileencoding}]
set statusline+=<r=%l\,c=%c%V>\ ASCII=%b\ HEX=%B
set laststatus=2 showcmd showmode
set secure

if &encoding !=# 'utf-8' | set encoding=japan fileencoding=japan | endif

nnoremap j	gj
nnoremap k	gk
nnoremap <Down> g<Down>
nnoremap <Up>   g<Up>

vnoremap j	gj
vnoremap k	gk
vnoremap <Down> g<Down>
vnoremap <Up>   g<Up>

"for searching
nnoremap n  nzz
nnoremap N  Nzz
nnoremap *  *zz
nnoremap #  #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap <ESC><ESC> :nohlsearch<ESC>

