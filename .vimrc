".vimrc file.
filetype plugin on
filetype indent on
syntax on
"colorscheme mycolor "located at $HOME/.vim/after/colors/mycolor.vim

set nocompatible number background=dark "light
set autoindent smartindent cindent " cursorline
set nostartofline showmatch autowrite backup writebackup
set incsearch ignorecase smartcase wrapscan hlsearch
set helpheight=10 cmdheight=1 history=1000
set wildmenu wildmode=list:longest,full
set clipboard=unnamed,unnamedplus
"set expandtab tabstop=4 softtabstop=0 shiftwidth=4
"set list listchars=tab:\▸\-

set statusline=[%n]\ %F\%(\ %M%R%H!%)
set statusline+=%<[%{&fileformat}][%{&fileencoding}]
set statusline+=<r=%l\,c=%c%V>(%P)%=\ ASCII=%b\ HEX=0x%02B
set laststatus=2 showcmd showmode
set visualbell t_vb= "for WSL

if &encoding !=# 'utf-8' | set encoding=japan fileencoding=japan | endif

if has('vim_starting')
	let &t_ti.="\e[1 q"
	let &t_SI.="\e[5 q" "insert mode caret
	let &t_EI.="\e[1 q" "normal mode caret
	let &t_te.="\e[0 q"
endif

augroup BinaryXXD
	autocmd!
	autocmd BufReadPre	*.bin let &binary =1
	autocmd BufReadPost	* if &binary | silent %!xxd -g 1
	autocmd BufReadPost	* set ft=xxd | endif
	autocmd BufWritePre	* if &binary | %!xxd -r | endif
	autocmd BufWritePost	* if &binary | silent %!xxd -g 1
	autocmd BufWritePost	* set nomod  | endif
augroup END

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

nnoremap <Tab>j :+tabmove<ESC>
nnoremap <Tab>k :-tabmove<ESC>
nnoremap <Tab>l :tabnext<ESC>
nnoremap <Tab>h :tabprevious<ESC>

nnoremap <Tab>c :tabnew<Space>
nnoremap <Tab>o :tabonly<ESC>

