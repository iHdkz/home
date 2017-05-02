#/bin/bash 

function __c {
[[ $2 == 1 ]] && echo -ne '\['
case "$1" in
	default)	echo -ne '\033[0m'    ;;
	white)		echo -ne '\033[1;37m' ;;
	gray)		echo -ne '\033[1;30m' ;; 
	blue)		echo -ne '\033[1;34m' ;;
	cyan)		echo -ne '\033[0;36m' ;;
	green)		echo -ne '\033[0;32m' ;;
	yellow)		echo -ne '\033[1;33m' ;;
	purple)		echo -ne '\033[1;35m' ;;
	light_red)	echo -ne '\033[1;31m' ;;
	light_blue)	echo -ne '\033[1;36m' ;;
	light_gray)	echo -ne '\033[0;37m' ;;
	light_green)	echo -ne '\033[1;32m' ;;
esac
[[ $2 == 1 ]] && echo -ne '\]'
return 0
}

function cd {
	if builtin pushd "${1:-$HOME}" > /dev/null ; then
	 [[ $(\ls |\wc -l) -le 100 ]] && ls && return
	 echo -e $(__c "purple")"many files exist"$(__c "default")
	fi
}

function pd {
	local __pd_pwd=$(builtin pwd)
	builtin pushd +1 > /dev/null
	echo -e $(__c "purple")"$__pd_pwd -> $(builtin pwd)"$(__c "default")
}

function nd {
	local __nd_pwd=$(builtin pwd)
	builtin pushd -0 > /dev/null
	echo -e $(__c "purple")"$__nd_pwd -> $(builtin pwd)"$(__c "default")
}

###
# Private functions for the prompt
function __exit_status {
	local __status_color=$(__c "white") # default color
	[[ $1 -ne 0 ]] && __status_color=$(__c "light_red") # error color
	echo -ne $__status_color"X"$(__c "default")
}

function __abbrev_pwd {
	\pwd | sed "s#^$HOME#\~#;s#^\(\~*/[^/]*/\).*\(/[^/]*\)#\1...\2#"
}

function __set_title {
	local __format="\033]0;%s\007"
	[[ $TERM == screen* ]] && __format="\033k%s\033\\"
	printf $__format "[$(__abbrev_pwd)]"
}
###
