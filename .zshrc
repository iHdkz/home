umask 022

HISTFILE=${HOME}/.zhistory
HISTSIZE=10000
SAVEHIST=10000

#cdpath=( ~ )
manpath=(/usr/pkg/man $MANPATH)

fpath=(${HOME}/.local/functions $fpath)
autoload -Uz conf.sh	&& conf.sh
autoload -Uz func.zsh	&& func.zsh
autoload -U  incr.zsh	&& incr.zsh

autoload -Uz add-zsh-hook
autoload -Uz compinit 	&& compinit

#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

local DEFAULT=$'\e[00m'
local GRAY=$'\e[1;30m'
local WHITE=$'\e[1;37m'
local RED=$'\e[1;31m'
local GREEN=$'\e[1;32m'
local YELLOW=$'\e[1;33m'
local BLUE=$'\e[1;34m'
local CYAN=$'\e[1;36m'
local MAGENTA=$'\e[1;35m'
local DARK_GRAY=$'\e[0;30m'
local DARK_WHITE=$'\e[0;37m'
local DARK_RED=$'\e[0;31m'
local DARK_GREEN=$'\e[0;32m'
local DARK_YELLOW=$'\e[0;33m'
local DARK_BLUE=$'\e[0;34m'
local DARK_CYAN=$'\e[0;36m'
local DARK_MAGENTA=$'\e[0;35m'

PROMPT='%{'$CYAN'%}''%(!.#.>)%(!.#.>) ''%{'$DEFAULT'%}'
PROMPT2="-- "
[[ -n "$SSH_CLIENT" ]] && __SSH='%{'$BLUE'%}'"remote:"
RPROMPT='%{''%(?.%F{white}.%F{red})''%}''X'
RPROMPT=$RPROMPT'%{'$DEFAULT'%}''['${__SSH:-""}'%{'$DARK_MAGENTA'%}'"%(3~,%-1~/.../%1~,%~)"'%{'$DEFAULT'%}'']'

#functions
add-zsh-hook preexec	__default_color
add-zsh-hook chpwd	__and_ls
add-zsh-hook chpwd	__pwd_title

function __default_color {
	print -nR $DEFAULT
}

function __and_ls {
	if [[ $(/bin/ls |wc -l) -le 50 ]] ; then
		ls
	else
		echo $GREEN "many files exist"
	fi
}

function title {
	if [[ $TERM == "screen" ]]; then
		#print -nR $'\033k'$1$'\033'\\\
		print -nR $'\033_'$1$'\033'\\
	elif [[ $TERM == "xterm" || $TERM == "rxvt" ]]; then
		print -nR $'\033]0;'$*$'\a'
	fi
}

function __pwd_title {
	#title "$(pwd | sed "s#^$HOME#\~#;s#^\(\~*/[^/]*/\).*\(/[^/]*\)#\1...\2#")"
	title "$USERNAME@$(hostname):$(pwd | sed "s#^$HOME#\~#")"
}

