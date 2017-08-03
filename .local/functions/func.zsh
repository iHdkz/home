#/usr/bin/env zsh

#autoload -Uz colors	&& colors
colors
function __default_color { print -nR ${reset_color} ; }

function __and_ls {
	[[ $(\ls |\wc -l) -le 50 ]] && ls && return
	echo "${fg[green]}many files exist"
}

function __pwd_title { [[ $TERM != "screen" ]] && set_title $(abbrev_pwd) ; }
#title "$(pwd | sed "s#^$HOME#\~#;s#^\(\~*/[^/]*/\).*\(/[^/]*\)#\1...\2#")"

function zshow_color_codes {
	for c in {000..255}
	do echo -n "\e[38;5;${c}m $c"; if [ $(($c%16)) -eq 15 ] && echo
	done; echo
}

