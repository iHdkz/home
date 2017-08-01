
__ls_call() {
	local __OSNAME=$(uname)
	local __LS_OPT='-BF --color=auto --show-control-char' #GNU ls
	[ -x \gls ] && echo "gls "${__LS_OPT} && return
	[ "${__OSNAME}" != "${__OSNAME%darwin*}" ] && __LS_OPT='-G'
	[ "${__OSNAME}" != "${__OSNAME#*BSD}"    ] && __LS_OPT='-Fw'
	echo "\ls "${__LS_OPT}
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
		local base_url="https://www.google.com/search?q=" ;
		\w3m ${base_url}$(echo "$*" | sed -e "s/ /+/g") ;
	}
fi

if [ "$(uname -s)" = "NetBSD" ] ; then
	alias get_pkgsrc="cd /usr && cvs -q -z3 -d anoncvs@anoncvs.NetBSD.org:/cvsroot checkout -P pkgsrc"
	alias update_pkgsrc="cd /usr/pkgsrc && cvs update -dP"
	alias mk_pkg_summary="/usr/pkg/sbin/pkg_info -aX | gzip > ./pkg_summary.gz"
fi

if [ ! -z "$ZSH_NAME" ]; then
	alias -s gp="gnuplot"
	alias -s gnu="gnuplot"
fi

