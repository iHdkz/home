syntax on
filetype plugin on
filetype indent on

set nocompatible
set number
"set cursorline
set autoindent smartindent
set autowrite backup writebackup
set nostartofline showmatch
set incsearch ignorecase smartcase wrapscan hlsearch
set helpheight=10 cmdheight=1

set wildmenu wildmode=list:longest,full
set history=1000

set clipboard=unnamed,unnamedplus

"FileStatus function is defined in this file
set statusline=[%n]\ %f\ %(\ %M%R%H!%)
set statusline+=[%{&fileformat}][%{&fileencoding}]
set statusline+=<r=%l\,c=%c%V>\ ASCII=%b\ HEX=%B
set laststatus=2
set showcmd showmode

if &encoding !=# 'utf-8'
	set encoding=japan
	set fileencoding=japan
endif

nnoremap j gj
nnoremap k gk
nnoremap <Down> g<Down>
nnoremap <Up>   g<Up>

vnoremap j gj
vnoremap k gk
vnoremap <Down> g<Down>
vnoremap <Up>   g<Up>

nnoremap n  nzz
nnoremap N  Nzz
nnoremap *  *zz
nnoremap #  #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap <ESC><ESC> :nohlsearch<ESC>

highlight Normal	ctermfg=Black
highlight PreProc	ctermfg=DarkMagenta
highlight Constant	ctermfg=DarkMagenta
highlight Special	ctermfg=DarkMagenta
highlight Comment	ctermfg=DarkGreen
highlight Identifier	ctermfg=DarkCyan
highlight Statement	ctermfg=DarkCyan
highlight Type		ctermfg=DarkCyan
highlight Search	ctermfg=Magenta
highlight Todo		ctermfg=Magenta

" vim -b : edit binary using xxd-format!
augroup BinaryXXD
	autocmd!
	autocmd BufReadPre   *.bin let &binary=1
	autocmd BufReadPost  * if &binary | silent %!xxd -g 1
	autocmd BufReadPost  * set ft=xxd | endif
	autocmd BufWritePre  * if &binary | %!xxd -r | endif
	autocmd BufWritePost * if &binary | silent %!xxd -g 1
	autocmd BufWritePost * set nomod  | endif
augroup END

