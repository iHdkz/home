#/bin/bash 

function show_color_codes {
for C in {0..255}; do
	tput setaf $C
	echo -n "$C "
done
tput sgr0
echo
}

function clrs {
[[ $1 == -1 ]] && printf "\[$(tput sgr0)\]"
[[ $1 != -1 ]] && printf "\[$(tput setaf $1)\]"
}

function cd {
	if builtin pushd "${1:-$HOME}" > /dev/null ; then
	 [[ $(\ls |\wc -l) -le 100 ]] && ls && return
	 echo -e $(clrs 5)"many files exist"$(clrs -1)
	fi
}

function pd {
	local __pd_pwd=$(builtin pwd)
	builtin pushd +1 > /dev/null
	echo -e $(clrs 5)"$__pd_pwd -> $(builtin pwd)"$(clrs -1)
}

function nd {
	local __nd_pwd=$(builtin pwd)
	builtin pushd -0 > /dev/null
	echo -e $(clrs 5)"$__nd_pwd -> $(builtin pwd)"$(clrs -1)
}

###
# Private functions for the prompt
function __abbrev_pwd {
	\pwd | \sed "s#^$HOME#\~#;s#^\(\~*/[^/]*/\).*\(/[^/]*\)#\1...\2#"
}

function __set_title {
	local __format="\033]0;%s\007"
	[[ $TERM == screen* ]] && __format="\033k%s\033\\"
	printf $__format "[$(__abbrev_pwd)]"
}
###
