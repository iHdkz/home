#!/usr/bin/env zsh

setopt extended_glob

typeset -gA abbreviations

function ialias() {
	[[ $# == 1 ]] && [[ $1 == *=* ]] && abbreviations[${1%%=*}]=${1#*=} ;
}

function magic-abbrev-expand() {
	local MATCH
	LBUFFER=${LBUFFER%%(#m)[-_a-zA-Z0-9]#}
	LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
	zle self-insert ; }

function no-magic-abbrev-expand() { LBUFFER+=' ' ; }

zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand
bindkey " " magic-abbrev-expand
bindkey "^x " no-magic-abbrev-expand
