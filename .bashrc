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
shopt -u hostcomplete cdspell cdable_vars sourcepath
shopt -s histappend histreedit histverify
shopt -s checkwinsize checkhash
shopt -s no_empty_cmd_completion extglob

DEFAULT='\[\e[0m\]'
WHITE='\[\e[1;37m\]'
GRAY='\[\e[1;30m\]'
BLUE='\[\e[1;34m\]'
CYAN='\[\e[0;36m\]'
GREEN='\[\e[0;32m\]'
YELLOW='\[\e[1;33m\]'
PURPLE='\[\e[1;35m\]'
LIGHT_RED='\[\e[1;31m\]'
LIGHT_BLUE='\[\e[1;36m\]'
LIGHT_GRAY='\[\e[0;37m\]'
LIGHT_GREEN='\[\e[1;32m\]'

export PS1=$LIGHT_RED'$(__exit_status $?)'$LIGHT_GREEN['$(__abbrev_pwd)']$LIGHT_BLUE": "$DEFAULT
export PS2=$LIGHT_BLUE-:$DEFAULT
export PROMPT_COMMAND="__set_title;"
#function update_teminal_cwd is defined in /etc/bashrc

