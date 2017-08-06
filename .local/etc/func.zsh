#/usr/bin/env zsh

function zshow_color_codes {
	for c in {000..255}
	do echo -n "\e[38;5;${c}m $c"; if [ $(($c%16)) -eq 15 ] && echo
	done; echo
}

