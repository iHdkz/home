
__ls_call() {
	local __OSNAME=$(uname)
	local __LS_OPT='-BF --color=auto --show-control-char' #GNU ls
	[ -x \gls ] && echo "\gls ""${__LS_OPT}" && return
	[ "${__OSNAME}" != "${__OSNAME%darwin*}" ] && __LS_OPT='-G'
	[ "${__OSNAME}" != "${__OSNAME#*BSD}"    ] && __LS_OPT='-Fwx'
	echo "\ls ""${__LS_OPT}"
}

alias ls="$(__ls_call)"
alias l.="ls .*"
alias la="ls -a"
alias ll="ls -hl"
alias lla="ls -ahl"
alias mv='\mv -iv'
alias cp='\cp -iv'
alias rm='\rm -iv'
alias info='\info --vi-keys'
alias bc='\bc -l'
#alias ln='/usr/bin/ln -i'
alias grep="\grep --color=auto --line-number -H"
alias lftp="\lftp -e 'set bmk:save-passwords on && set cmd:prompt \[\e[34m\]\w\[\e[32m\]\ \>\>\[\e[0m\]\ '"
alias ...='cd ../..'
alias ....='cd ../../..'

#alias less=${PAGER:=\less}
[ ! -z $(which vim) ]  && alias vi="\vim"

if [ ! -z "$(which w3m)" ] ; then
	PAGER="\w3m"
	alias less=$PAGER
	alias man="\w3mman"
	ggl() {
		local g_url="https://www.google.com" ;
		local opts="/search?"
		\w3m "${g_url}${opts}&q="$(echo "$*" | sed -e "s/ /+/g") ;
	}
fi

### pkgsrc settings
if [ "$(uname -s)" = "NetBSD" ] ; then
	alias get_pkgsrc="cd /usr && cvs -q -z3 -d anoncvs@anoncvs.NetBSD.org:/cvsroot checkout -P pkgsrc"
	alias update_pkgsrc="cd /usr/pkgsrc && cvs update -dP"
	alias mk_pkg_summary="cd /usr/pkgsrc/packages && /usr/pkg/sbin/pkg_info -X | gzip > ./pkg_summary.gz"
fi

### Zsh options
if [ ! -z "$ZSH_NAME" ]; then
	alias -s gp="gnuplot"
	alias -s gnu="gnuplot"
fi

### define functions ###
show_color_codes() {
	local c=0
	while [ $c -lt 256 ] ; do
		tput setaf $c ; echo -n "$c "
		c=$(expr 1 + $c)
	done
	tput sgr0 ; echo
}

set_title() {
	local frmt="\033]0;%s\007"
	[ "${TERM}" != "${TERM#*screen*}" ] && frmt="\033k%s\033\\"
	printf $frmt "$@"
}

abbrev_pwd() { \pwd | \sed "s#^$HOME#\~#;s#^\(\~*/[^/]*/\).*\(/[^/]*\)#\1...\2#" ; }

