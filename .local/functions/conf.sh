[[ $OSTYPE == darwin* ]] && __LS_OPT='-G'
[[ $OSTYPE == linux*  ]] && __LS_OPT='-BF --color=auto --show-control-char'
[[ $OSTYPE == *bsd*   ]] && __LS_OPT='-Fw'
alias ls="\ls "$__LS_OPT
[[ -x gls ]] && alias ls="gls -BF --color=auto --show-control-char"

alias l.="ls .*"
alias la="ls -a"
alias ll="ls -hl"
alias lla="ls -ahl"
alias less=${PAGER:=w3m}
alias man="w3mman"
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

if [[ $ZSH_NAME == zsh ]]; then
	alias -s gp="gnuplot"
	alias -s gnu="gnuplot"
fi
