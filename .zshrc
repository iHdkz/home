umask 022

manpath=(/usr/pkg/man $MANPATH)
fpath=(${HOME}/.local/functions $fpath)
cdpath=( ~ )

autoload -Uz add-zsh-hook
autoload -Uz aliases.sh		&& aliases.sh
autoload -U  incr.zsh		&& incr.zsh
#autoload predict-on	&& predict-on

local DEFAULT=$'%{\e[00m%}'
local GRAY=$'%{\e[1;30m%}'
local WHITE=$'%{\e[1;37m%}'
local RED=$'%{\e[1;31m%}'
local GREEN=$'%{\e[1;32m%}'
local YELLOW=$'%{\e[1;33m%}'
local BLUE=$'%{\e[1;34m%}'
local CYAN=$'%{\e[1;36m%}'
local MAGENTA=$'%{\e[1;35m%}'
local DARK_GRAY=$'%{\e[0;30m%}'
local DARK_WHITE=$'%{\e[0;37m%}'
local DARK_RED=$'%{\e[0;31m%}'
local DARK_GREEN=$'%{\e[0;32m%}'
local DARK_YELLOW=$'%{\e[0;33m%}'
local DARK_BLUE=$'%{\e[0;34m%}'
local DARK_CYAN=$'%{\e[0;36m%}'
local DARK_MAGENTA=$'%{\e[0;35m%}'

case ${SSH_CLIENT:-"DontUseSSH"} in
"DontUseSSH" ) PROMPT=$CYAN'%(!.#.>)%(!.#.>) '$DEFAULT ;;
*	     ) PROMPT=$CYAN'%(!.#.>)%(!.#.>)'$DARK_RED'%(!.#.>) '$DEFAULT ;;
esac
PROMPT2=$GREEN"-"$YELLOW"-"$DARK_MAGENTA'>'$DEFAULT' '
#RPROMPT='%{%(?.$fg[white].$fg[red])%}X'$DEFAULT'['$DARK_MAGENTA"%(3~,%-1~/.../%1~,%~)"$DEFAULT']'

#functions

add-zsh-hook chpwd __with_ls
add-zsh-hook chpwd pwd_title
function __with_ls {
	if [[ $(/bin/ls |wc -l) -le 50 ]] ; then
		ls
	else
		echo $GREEN "many files exist"
	fi
}

function pd {
	local pd_pwd=$(builtin pwd)
	builtin pushd +1 > /dev/null
	echo -e $GREEN "$pd_pwd -> $(builtin pwd)"
}

function nd {
	local nd_pwd=$(builtin pwd)
	builtin pushd -0 > /dev/null
	echo -e $GREEN "$nd_pwd -> $(builtin pwd)"
}

function title {
	if [[ $TERM == "screen" ]]; then
		#print -nR $'\033k'$1$'\033'\\\
		print -nR $'\033_'$1$'\033'\\\

	elif [[ $TERM == "xterm" || $TERM == "rxvt" ]]; then
		print -nR $'\033]0;'$*$'\a'
	fi
}

function pwd_title {
	#title "$(pwd | sed "s#^$HOME#\~#;s#^\(\~*/[^/]*/\).*\(/[^/]*\)#\1...\2#")"
	title "$USERNAME@$(hostname):$(pwd | sed "s#^$HOME#\~#")"
}
pwd_title

