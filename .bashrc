# /etc/skel/.bashrc:
# $Header: /virtual/aloe/cvsroot/dot.files/.bashrc,v 1.1 2007/09/04 05:38:36 aloe Exp $
# 
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.

umask 022

# outputting anything in those cases.
# Shell is non-interactive.  Be done now
[[ $- != *i* ]] && return
source ${HOME}/.config/etc/conf.sh

shopt -u cdspell cdable_vars sourcepath # unset options
shopt -s checkwinsize checkhash extglob # set options
shopt -s hostcomplete no_empty_cmd_completion
###
function cd {
	if builtin cd "${1:-$HOME}" ; then
		[[ $(\ls -1 | \wc -l) -le 100 ]] && ls && return
		echo -e $(tput setaf 5)"many files exist"$(tput sgr0)
	fi
}
function clrs { [[ $# != 0 ]] && echo -n "\[$(tput setaf $1)\]" || echo -n "\[$(tput sgr0)\]" ; }
###
export PS1=$(clrs 1)'$([[ $? != 0 ]] && echo -n "X" || echo -n " ")'$(clrs 2)['$(abbrev_pwd)']"$(clrs): "
export PS2=$(clrs 5)-$(clrs)": "
export PS4='+($BASH_SOURCE:$LINENO): ${FUNCNAME:+$FUNCNAME(): }'
export PROMPT_COMMAND='set_title_tab "[$(abbrev_pwd)]" ;'
#function update_teminal_cwd is defined in /etc/bashrc

