#/usr/bin/env zsh

__IAB="done"
setopt extended_glob

typeset -g -A abbreviations
abbreviations=(
"G"    "| grep"
"X"    "| xargs"
#"T"    "| tail"
#"C"    "| cat"
#"W"    "| wc"
#"A"    "| awk"
#"S"    "| sed"
"E"    "2>&1 > /dev/null"
"N"    "> /dev/null"
"ccg"  "cc -ansi -Wall -pedantic-errors"
"_safe" "-ansi -Wall -pedantic-errors"
"_gsl" "-lgsl -lgslcblas -lm"
)

magic-abbrev-expand() {
	local MATCH
	LBUFFER=${LBUFFER%%(#m)[-_a-zA-Z0-9]#}
	LBUFFER+=${abbreviations[$MATCH]:-$MATCH}
	zle self-insert
}

no-magic-abbrev-expand() {
	LBUFFER+=' '
}

zle -N magic-abbrev-expand
zle -N no-magic-abbrev-expand
bindkey " " magic-abbrev-expand
bindkey "^x " no-magic-abbrev-expand
