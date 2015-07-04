umask 022

manpath=(/usr/pkg/man $MANPATH)
fpath=(${HOME}/.local/functions $fpath)
cdpath=( ~ )

autoload -U incr.zsh	&& incr.zsh

local DEFAULT=$'%{\e[00m%}'
local GRAY=$'%{\e[1;30m%}'
local DARK_GRAY=$'%{\e[0;30m%}'
local RED=$'%{\e[1;31m%}'
local DARK_RED=$'%{\e[0;31m%}'
local GREEN=$'%{\e[1;32m%}'
local DARK_GREEN=$'%{\e[0;32m%}'
local YELLOW=$'%{\e[1;33m%}'
local DARK_YELLOW=$'%{\e[0;33m%}'
local BLUE=$'%{\e[1;34m%}'
local DARK_BLUE=$'%{\e[0;34m%}'
local MAGENTA=$'%{\e[1;35m%}'
local DARK_MAGENTA=$'%{\e[0;35m%}'
local CYAN=$'%{\e[1;36m%}'
local DARK_CYAN=$'%{\e[0;36m%}'
local WHITE=$'%{\e[1;37m%}'
local DARK_WHITE=$'%{\e[0;37m%}'

case ${SSH_CLIENT:-"DontUseSSH"} in
"DontUseSSH" ) PROMPT=$CYAN'%(!.#.>)%(!.#.>) '$DEFAULT ;;
*	     ) PROMPT=$CYAN'%(!.#.>)%(!.#.>)'$DARK_RED'%(!.#.>) '$DEFAULT ;;
esac
PROMPT2=$GREEN"-"$YELLOW"-"$DARK_MAGENTA'>'$DEFAULT' '
#RPROMPT='%{%(?.$fg[white].$fg[red])%}X'$DEFAULT'['$DARK_MAGENTA"%(3~,%-1~/.../%1~,%~)"$DEFAULT']'

#functions

function chpwd() {
if [ $(/bin/ls |wc -l) -le 50 ] ; then
    ls
else
    echo "\e[32m" "many files exist"
fi
dirTitle
}

function pd {
pd_pwd=$(builtin pwd)
builtin pushd +1 > /dev/null
dirTitle
echo "\e[32m" "$pd_pwd -> $(builtin pwd)"
}

function nd {
nd_pwd=$(builtin pwd)
builtin pushd -0 > /dev/null
dirTitle
echo "\e[32m" "$nd_pwd -> $(builtin pwd)"
}

function title {
if [[ $TERM == "screen" ]]; then
    #print -nR $'\033k'$1$'\033'\\\
    print -nR $'\033_'$1$'\033'\\\

elif [[ $TERM == "xterm" || $TERM == "rxvt" ]]; then
    print -nR $'\033]0;'$*$'\a'
fi
}

function dirTitle {
#title "$(pwd | sed "s#^$HOME#\~#;s#^\(\~*/[^/]*/\).*\(/[^/]*\)#\1...\2#")"
title "$USERNAME@$(hostname):$(pwd | sed "s#^$HOME#\~#")"
}
dirTitle


