#/bin/bash 

function __c {
case "$1" in
	default)	echo -ne '\[\e[0m\]'    ;;
	white)		echo -ne '\[\e[1;37m\]' ;;
	gray)		echo -ne '\[\e[1;30m\]' ;; 
	blue)		echo -ne '\[\e[1;34m\]' ;;
	cyan)		echo -ne '\[\e[0;36m\]' ;;
	green)		echo -ne '\[\e[0;32m\]' ;;
	yellow)		echo -ne '\[\e[1;33m\]' ;;
	purple)		echo -ne '\[\e[1;35m\]' ;;
	light_red)	echo -ne '\[\e[1;31m\]' ;;
	light_blue)	echo -ne '\[\e[1;36m\]' ;;
	light_gray)	echo -ne '\[\e[0;37m\]' ;;
	light_green)	echo -ne '\[\e[1;32m\]' ;;
esac
return 0
}

function cd {
	if builtin pushd "${1:-$HOME}" > /dev/null ; then
	 [[ $(\ls |wc -l) -le 100 ]] && ls && return
	 echo $(__c "light_red")"many files exist"$(__c "default")
	fi
}

function pd {
	__pd_pwd=$(builtin pwd)
	builtin pushd +1 > /dev/null
	echo -e "$__pd_pwd -> $(builtin pwd)"
}

function nd {
	__nd_pwd=$(builtin pwd)
	builtin pushd -0 > /dev/null
	echo -e "$__nd_pwd -> $(builtin pwd)"
}

###
# Private functions for the prompt
function __exit_status {
	[[ $1 -eq 0 ]] && echo -n " "
	[[ $1 -ne 0 ]] && echo -n "X"
}

function __abbrev_pwd {
	pwd | sed "s#^$HOME#\~#;s#^\(\~*/[^/]*/\).*\(/[^/]*\)#\1...\2#"
}

function __set_title {
case $TERM in
	xterm*|rxvt*|Eterm)
		echo -ne "\033]0;" #BEGIN set title
		echo -ne "[$(__abbrev_pwd)]"
		echo -ne "\007"    #END set title
		;;
	screen*)
		echo -ne "\033k"   #BEGIN set window title
		echo -ne [$(__abbrev_pwd)]
		echo -ne '\033\\'  #END set window title
		#		echo -ne "\033P\033]0;" #BEGIN set
		#		echo -ne "ok"
		#		echo -ne '\007\033\\'   #END set
		;;
esac
}
###
