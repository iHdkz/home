" Vim color file

hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "mycolor"

" vim: sw=2

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


