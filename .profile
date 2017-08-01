# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile
umask 022

add_new_path() {
	if [ -d "$1" ] ; then
		case "$PATH" in
			*"$1"*	) echo "" ;;
			*	) echo "$PATH"":""$1" ;;
		esac
	fi
}

PATH=$(add_new_path "/sbin")
PATH=$(add_new_path "/usr/sbin")
PATH=$(add_new_path "/usr/X11R7/bin")
export PATH

ENV=$HOME/.shrc		; export ENV
LANG=ja_JP.UTF-8 	; export LANG
LC_MESSAGES=C		; export LC_MESSAGES

#BSD_BASESITE="ftp://ftp.NetBSD.org/pub/"
BSD_BASESITE="https://ihdkz.github.io/raspi"
PKG_PATH="${BSD_BASESITE}/pkgsrc/packages/$(uname -s)/$(uname -m)/8.0/All"
export PKG_PATH

# set PATH so it includes user's private bin if it exists
# [ -d ${HOME}/bin ] && PATH=${HOME}/bin:${PATH}

# set PATH so it includes additional installed bin if it exists
if [ -d "/opt/local" ] ; then
	__MACPATH__=/opt/local
	PATH=$(add_new_path "/opt/local/bin")
	PATH=$(add_new_path "/opt/local/sbin")
	PATH=$(add_new_path "/opt/local/lib/fpc/bin")
	PATH=$(add_new_path "/Applications/Racket v6.1.1/bin")
	PATH=$(add_new_path "$HOME/Library/Haskell/bin")
	# Finished adapting your PATH environment variable for use with MacPorts.

	[ -z "$INFOPATH" ] && export INFOPATH=${__MACPATH__}/share/info

	PYTHONPATH=${__MACPATH__}/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages
fi

PYTHONPATH=$HOME/.python.d:"$PYTHONPATH"	; export PYTHONPATH
PYTHONSTARTUP=$HOME/.pythonrc.py	; export PYTHONSTARTUP

XMODIFIERS=@im=uim
GTK_IM_MODULE=uim

# if running bash and including .bashrc if it exists
#[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . $HOME/.bashrc

