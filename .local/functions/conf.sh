case "${OSTYPE}" in
	darwin*)
		alias ls='ls -G'
		;;
	linux*)
		alias ls='ls -BF --color=auto --show-control-char'
		;;
	*bsd*)
		if [[ -x gls ]] ; then
			alias ls="gls -BF --color=auto --show-control-char"
		else
			alias ls="/bin/ls -Fw"
		fi
		;;
esac

alias l.="ls .*"
alias la="ls -a"
alias ll="ls -hl"
alias lla="ls -ahl"
alias less=${PAGER:=less}
alias man="w3mman"
alias mv='/bin/mv -iv'
alias cp='/bin/cp -iv'
alias rm='/bin/rm -iv'
alias info='/usr/bin/info --vi-keys'
alias bc='/usr/bin/bc -l'
#alias ln='/usr/bin/ln -i'
unalias grep 2> /dev/null ; alias grep="grep --color=auto"
unalias lftp 2> /dev/null ; alias lftp="lftp -e 'set bmk:save-passwords on && set cmd:prompt \[\e[34m\]\w\[\e[32m\]\ \>\>\[\e[0m\]\ '"
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'

