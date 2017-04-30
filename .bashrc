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

PS1=$(__c "light_red")'$(__exit_status $?)'
PS1=$PS1$(__c "light_green")['$(__abbrev_pwd)']
PS1=$PS1$(__c "light_blue")": "$(__c "default")
export PS1
export PS2=$(__c "light_blue")-:$(__c "default")
export PROMPT_COMMAND="__set_title;"
#function update_teminal_cwd is defined in /etc/bashrc

