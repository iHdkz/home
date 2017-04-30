# /etc/skel/.bashrc:
# $Header: /virtual/aloe/cvsroot/dot.files/.bashrc,v 1.1 2007/09/04 05:38:36 aloe Exp $
# 
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.

#PATH=$PATH:$HOME/.local/bin
umask 022

# outputting anything in those cases.
# Shell is non-interactive.  Be done now
[[ $- != *i* ]] && return

FPATH=${HOME}/.local/functions
source ${FPATH}/conf.sh
source ${FPATH}/bash_funcs.sh

HISTSIZE=5000
HISTCONTROL=ignoreboth
HISTFILESIZE=1000
shopt -u hostcomplete
shopt -s cdspell
shopt -s cdable_vars
shopt -u sourcepath
shopt -s histappend
shopt -s histreedit
shopt -s histverify
shopt -s checkwinsize
shopt -s checkhash
shopt -s no_empty_cmd_completion
shopt -s extglob

DEFAULT='\e[0m'
WHITE='\e[1;37m'
GRAY='\e[1;30m'
BLUE='\e[1;34m'
CYAN='\e[0;36m'
GREEN='\e[0;32m'
YELLOW='\e[1;33m'
PURPLE='\e[1;35m'
LIGHT_RED='\e[1;31m'
LIGHT_BLUE='\e[1;36m'
LIGHT_GRAY='\e[0;37m'
LIGHT_GREEN='\e[1;32m'

case $TERM in
	xterm*|rxvt*|Eterm) 
	 PS1='\['$LIGHT_RED'\]''$(__exit_status $?)'
	 PS1=$PS1'\['$LIGHT_GREEN'\]'['$(__abbrev_pwd)']
#	 PS1=$PS1${LIGHT_RED}$(LC_TIME=C date "+%m/%d(%a)%H:%M")
	 PS1=$PS1'\['$LIGHT_BLUE'\]'": "'\['$DEFAULT'\]'
	 #status value
	;;
	screen*)
	 PS1='\['$LIGHT_GREEN'\]''\u''\['$LIGHT_BLUE'\]':
	 PS1=$PS1'\['$LIGHT_RED'\]''$(__exit_status $?)''\['$DEFAULT'\]'
	;;
esac

export PS1
export PS2='\['$LIGHT_BLUE'\]'-:'\['$DEFAULT'\]'
export PROMPT_COMMAND="__set_title;"
#function update_teminal_cwd is defined in /etc/bashrc

###
# Private functions for the prompt
function __exit_status {
	if [[ $1 -eq 0 ]] ; then
		echo -n " "
	else
		echo -n "X"
	fi
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
