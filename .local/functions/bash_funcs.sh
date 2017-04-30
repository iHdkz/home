#/bin/bash 

function cd {
	if builtin pushd "${1:-$HOME}" > /dev/null ; then
	 [[ $(\ls |wc -l) -le 100 ]] && ls && return
 	 echo ${LIGHT_RED} "many files exist" ${DEFAULT}
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
