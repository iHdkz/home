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
set statusline+=%{FileStatus()}
set statusline+=Pos=<%l\,%c%V>\ ASCII=%b\ HEX=%B
set laststatus=2
set showcmd showmode

function FileStatus()
 return '[' . &fileformat . ']' . '[' . &fileencoding . ']' . ' '
endfunction

if &encoding !=# 'utf-8'
	set encoding=japan
	set fileencoding=japan
endif

nnoremap j gj
nnoremap k gk
nnoremap <Down> g<Down>
nnoremap <Up> g<Up>

vnoremap j gj
vnoremap k gk
vnoremap <Down> g<Down>
vnoremap <Up> g<Up>

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap <ESC><ESC> :nohlsearch<ESC>

hi Normal	cterm=none ctermfg=Black	term=none
hi PreProc	cterm=none ctermfg=DarkMagenta	term=none
hi Constant	cterm=none ctermfg=DarkMagenta	term=none
hi Special	cterm=none ctermfg=DarkMagenta	term=none
hi Comment	cterm=none ctermfg=DarkGreen	term=none
hi Identifier	cterm=none ctermfg=DarkCyan	term=none
hi Statement	cterm=none ctermfg=DarkCyan	term=none
hi Type		cterm=none ctermfg=DarkCyan	term=none
hi Search		   ctermfg=Magenta	term=none
hi Todo			   ctermfg=Magenta	term=none

" vim -b : edit binary using xxd-format!
augroup Binary
	au!
	au BufReadPre   *.bin let &bin=1
	au BufReadPost  *.bin if &bin | silent %!xxd
	au BufReadPost  *.bin set ft=xxd | endif
	au BufWritePre  *.bin if &bin | silent %!xxd -r
	au BufWritePre  *.bin endif
	au BufWritePost *.bin if &bin | %!xxd
	au BufWritePost *.bin set nomod | endif
augroup END


