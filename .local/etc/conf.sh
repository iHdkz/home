
_chk_os() { local osname="$(uname -s)" && [ "$osname" != "${osname#*$1*}" ] ; }
_ls_call() {
	local ls_opt='-CF --color=auto --show-control-char' #GNU ls
	[ ! -z "$(which gls)" ] && echo "\gls ""${ls_opt}" && return
	_chk_os "Darwin"	&& ls_opt='-G'
	_chk_os "BSD"		&& ls_opt='-CdFw'
	echo "\ls ""${ls_opt}"
}

alias ls="$(_ls_call)"
alias l.="ls .*"
alias la="ls -a"
alias ll="ls -hl"
alias lla="ls -ahl"
alias mv='\mv -iv'
alias cp='\cp -iv'
alias rm='\rm -iv'
alias info='\info --vi-keys'
alias bc='\bc -l'
#alias ln='/usr/bin/ln -i'
alias grep="\grep --color=auto --line-number -H"
alias lftp="\lftp -e 'set bmk:save-passwords on && set cmd:prompt \[\e[34m\]\w\[\e[32m\]\ \>\>\[\e[0m\]\ '"
alias ...='cd ../..'
alias ....='cd ../../..'

#alias less=${PAGER:=\less}
[ ! -z "$(which vim)" ]  && alias vi="\vim"

if [ ! -z "$(which w3m)" ] ; then
	PAGER="\w3m"
	alias less=${PAGER:=\vim -R}
	alias man="\w3mman"
	ggl() {
		local g_url="https://www.google.com"
		local opts="/search?"
		\w3m "${g_url}${opts}&q="$(echo "$*" | sed -e "s/ /+/g") ;
	}
	eow() {
		local eow_url="http://eow.alc.co.jp" 
		local opts="/search?"
		\w3m "${eow_url}${opts}q="$(echo "$*" | sed -e "s/ /+/g") ;
	}
fi

### Zsh options
if [ ! -z "$ZSH_NAME" ] ; then
	alias -s gp="gnuplot"
	alias -s gnu="gnuplot" 
	##
	zshow_color_codes() { 
		for c in "{000..255}" ; do
			echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo 
		done
	}
	##
	if [[ -f ./iab.zsh ]] ; then
		autoload -Uz iab.zsh	&& iab.zsh
		##
		ialias G="| grep"
		ialias X="| xargs"
		#ialias T="| tail"
		#ialias C="| cat"
		#ialias W="| wc"
		#ialias A="| awk"
		#ialias S="| sed"
		ialias E="2>&1 > /dev/null"
		ialias N="> /dev/null"
		ialias ccg="cc -ansi -Wall -pedantic-errors"
		ialias _safe="-ansi -Wall -pedantic-errors"
		ialias _gsl="-lgsl -lgslcblas -lm"
	fi
fi

### define functions ###
show_color_codes() {
	for c in $(seq 1 256) ; do
		printf $(tput setaf $c)"%4s" $c
	done
	tput sgr0 ; echo
}

set_title() { printf "\033]0;%s\007" "$@" ; }
set_screen_tab() { printf "\033k%s\033\\" "$@" ; }
set_title_tab() { [ "$TERM" != "${TERM#*screen*}" ] && set_screen_tab "$@" || set_title "$@" ; }
abbrev_pwd() { \pwd | \sed "s#^$HOME#\~#;s#^\(\~*/[^/]*/\).*\(/[^/]*\)#\1...\2#" ; }

unset _chk_os
unset _ls_call
