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

