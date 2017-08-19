# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile
umask 022

ENV=$HOME/.shrc		; export ENV
LANG=ja_JP.UTF-8 	; export LANG
LC_CTYPE=C		; export LC_CTYPE
LC_COLLATE=C		; export LC_COLLATE
LC_MESSAGES=C		; export LC_MESSAGES

XMODIFIERS="@im=uim"	; export XMODIFIERS
GTK_IM_MODULE=uim	; export GTK_IM_MODULE

PYTHONPATH=$HOME/.python.d		; export PYTHONPATH
PYTHONSTARTUP=$HOME/.pythonrc.py	; export PYTHONSTARTUP
GITHUB=ssh://git@github.com/iHdkz	; export GITHUB

is_contained_in() { [ "$2" != "${2#*$1*}" ] ; }
chk_uname() { is_contained_in "$1" "$(uname -s)" ; }
add_path() { echo "$2"$( [ -d "$1" ] && ! is_contained_in "$1" "$2" && echo ":$1") ; }

PATH=$(add_path /sbin		 $PATH)
PATH=$(add_path /usr/pkg/sbin    $PATH)
PATH=$(add_path /usr/sbin	 $PATH)
PATH=$(add_path /usr/X11R7/bin   $PATH)
PATH=$(add_path $HOME/.local/bin $PATH)
export PATH

# set PATH so it includes user's private bin if it exists
# [ -d ${HOME}/bin ] && PATH=${HOME}/bin:${PATH}

if chk_uname "NetBSD" ; then
	#BSD_SITE=ftp://ftp.NetBSD.org/pub/
	#BSD_SITE=http://cdn.NetBSD.org/pub
	BSD_SITE=https://ihdkz.github.io/raspi
	PKG_PATH="${BSD_SITE}/pkgsrc/packages/$(uname -s)/$(uname -m)/8.0/All"
	export PKG_PATH
fi

# set PATH so it includes additional installed bin if it exists
if chk_uname "Darwin" ; then
	PATH=$(add_path /opt/local/bin		  $PATH)
	PATH=$(add_path /opt/local/sbin		  $PATH)
	PATH=$(add_path /opt/local/lib/fpc/bin	  $PATH)
	PATH=$(add_path $HOME/Library/Haskell/bin $PATH)
	PATH=$(add_path /Applications/Racket v6.1.1/bin $PATH)
	# Finished adapting your PATH environment variable for use with MacPorts.

	[ -z "$INFOPATH" ] && export INFOPATH=/opt/local/share/info
	PYTHONPATH=$(add_path /opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages $PYTHONPATH)
fi

# if running bash and including .bashrc if it exists
#[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . $HOME/.bashrc

unset is_contained_in
unset chk_uname
unset add_new_path

