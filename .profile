# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile
umask 022

ENV=$HOME/.shrc		; export ENV
LANG=ja_JP.UTF-8 	; export LANG
LC_MESSAGES=C		; export LC_MESSAGES

XMODIFIERS="@im=uim"	; export XMODIFIERS
GTK_IM_MODULE=uim	; export GTK_IM_MODULE

PYTHONPATH=$HOME/.python.d		; export PYTHONPATH
PYTHONSTARTUP=$HOME/.pythonrc.py	; export PYTHONSTARTUP

GITHUB="https://github.com/iHdkz/"	; export GITHUB

is_contain_in() {
	case "$2" in
		*"$1"*	) true  ;;
		*	) false ;;
	esac
}
add_new_path() { echo "$PATH"$( [ -d "$1" ] && ! is_contain_in "$1" "$PATH" && echo ":$1") ; }

PATH=$(add_new_path "/sbin")
PATH=$(add_new_path "/usr/pkg/sbin")
PATH=$(add_new_path "/usr/sbin")
PATH=$(add_new_path "/usr/X11R7/bin")
export PATH

# set PATH so it includes user's private bin if it exists
# [ -d ${HOME}/bin ] && PATH=${HOME}/bin:${PATH}

if is_contain_in "NetBSD" "$(uname -s)" ; then
	#BSD_SITE="ftp://ftp.NetBSD.org/pub/"
	BSD_SITE="https://ihdkz.github.io/raspi"
	PKG_PATH="${BSD_SITE}/pkgsrc/packages/$(uname -s)/$(uname -m)/8.0/All"
	export PKG_PATH
fi

# set PATH so it includes additional installed bin if it exists
if is_contain_in "Darwin" "$(uname -s)" ; then
	__MACPATH__=/opt/local
	PATH=$(add_new_path "/opt/local/bin")
	PATH=$(add_new_path "/opt/local/sbin")
	PATH=$(add_new_path "/opt/local/lib/fpc/bin")
	PATH=$(add_new_path "/Applications/Racket v6.1.1/bin")
	PATH=$(add_new_path "$HOME/Library/Haskell/bin")
	# Finished adapting your PATH environment variable for use with MacPorts.

	[ -z "$INFOPATH" ] && export INFOPATH=${__MACPATH__}/share/info
	PYTHONPATH="$PYTHONPATH":${__MACPATH__}/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages
fi

# if running bash and including .bashrc if it exists
#[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . $HOME/.bashrc

unset is_contain_in
unset add_new_path

