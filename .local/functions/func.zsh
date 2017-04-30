#/usr/bin/env zsh

#autoload -Uz colors	&& colors
function __default_color {
	print -nR ${reset_color}
}

function __and_ls {
	if [[ $(/bin/ls |wc -l) -le 50 ]] ; then
		ls ${__LS_OPT:-"-G"}
	else
		echo "${fg[green]}many files exist"
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

function show_color_codes {
	for c in {000..255}
	do echo -n "\e[38;5;${c}m $c"; if [ $(($c%16)) -eq 15 ] && echo
	done; echo
}

