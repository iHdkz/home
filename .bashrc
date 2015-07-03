# /etc/skel/.bashrc:
# $Header: /virtual/aloe/cvsroot/dot.files/.bashrc,v 1.1 2007/09/04 05:38:36 aloe Exp $
# 
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.

#PATH=$PATH:$HOME/.local/bin
umask 022

#CONFIGURE=${HOME}/.userconfig/
#source /etc/bash_completion
#source /etc/profile.d/bash-completion
#source ${CONFIGURE}/settings
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

# outputting anything in those cases.
if [[ $- != *i* ]]; then
	# Shell is non-interactive.  Be done now
	return
fi

DEFAULT=$'\e[m'
GRAY=$'\e[1;30m'
LIGHT_GRAY=$'\e[0;37m'
WHITE=$'\e[1;37m'
LIGHT_RED=$'\e[1;31m'
LIGHT_BLUE=$'\e[1;36m'
YELLOW=$'\e[1;33m'
PURPLE=$'\e[1;35m'
GREEN=$'\e[0;32m'
LIGHT_GREEN=$'\e[1;32m'
BLUE=$'\e[1;34m'
CYAN=$'\e[0;36m'

export PS1='\[$(__ps1_status $?)\]'
export PS2="\[${LIGHT_BLUE}-:${DEFAULT}\]"
if [[ ! $PROMPT_COMMAND = *__set_title* ]] ; then
	 export PROMPT_COMMAND="__set_title;$PROMPT_COMMAND"
	 #function update_teminal_cwd is defined in /etc/bashrc
fi

###
# Private functions for the prompt

function __ps1_status {
case $TERM in
	xterm*|rxvt*|Eterm) 
		echo -ne ${PURPLE}$(LC_TIME=C date "+%m/%d(%a)%H:%M")
		echo -ne ${LIGHT_GREEN}[$(__abbrev_pwd)]
		#status value
		;;
	screen*)
		echo -ne ${PURPLE}${USER}
		;;
esac
if [[ $1 -eq 0 ]] ; then
	echo -ne "${LIGHT_BLUE}:"
else
	echo -ne "${LIGHT_RED}X"
fi
echo -ne " ${DEFAULT}"
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

case "${OSTYPE}" in
	darwin*)
		alias ls="ls -G"
		alias ll="ls -lG"
		alias la="ls -laG"
		;;
	linux*)
		alias ls='ls --color'
		alias ll='ls -l --color'
		alias la='ls -la --color'
		;;
esac

function cd {
if builtin pushd "${1:-$HOME}" > /dev/null ; then
    if [ $(/bin/ls |wc -l) -le 100 ] ; then
		ls
    else
		echo ${LIGHT_RED} "many files exist" ${DEFAULT}
    fi
fi
}

function pd {
	builtin pushd +1 > /dev/null
	builtin pwd
ls
}

function nd {
	builtin pushd -0 > /dev/null
	builtin pwd
ls
}

