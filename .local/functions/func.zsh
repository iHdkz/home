#/usr/bin/env zsh

function pd {
	__pd_pwd=$(builtin pwd)
	builtin pushd +1 > /dev/null
	echo -e $GREEN "$__pd_pwd -> $(builtin pwd)"
}

function nd {
	__nd_pwd=$(builtin pwd)
	builtin pushd -0 > /dev/null
	echo -e $GREEN "$__nd_pwd -> $(builtin pwd)"
}

function google {
local str opt
if [[ $# != 0 ]] ; then
	for i in $*; do
		str="$str+$i"
	done    
	str=`echo $str | sed 's/^\+//'`
	opt='search?num=50&hl=ja&ie=euc-jp&oe=euc-jp&lr=lang_ja'
	opt="${opt}&q=${str}"
fi
w3m http://www.google.co.jp/$opt
}

