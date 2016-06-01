# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile
#umask 022

# if running bash
#if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
#    if [ -f ~/.bashrc ]; then
#	. ~/.bashrc
#    fi
#fi

# set PATH so it includes user's private bin if it exists
if [ -d ~/bin ] ; then
    PATH=~/bin:"${PATH}"
fi
# set PATH so it includes additional installed bin if it exists
if [ -d /Applications/Racket\ v6.1.1/bin ] ; then
	PATH=/Applications/Racket\ v6.1.1/bin:${PATH}
fi
if [ -d /opt/local/lib/fpc/bin ] ; then
	PATH=/opt/local/lib/fpc/bin:${PATH}
fi
if [ -d $HOME/Library/Haskell/bin ] ; then
	PATH=$HOME/Library/Haskell/bin:${PATH}
fi

# Finished adapting your PATH environment variable for use with MacPorts.
PATH=/opt/local/bin:/opt/local/sbin:${PATH}
#### EXPORTING "PATH" ####
export PATH
##########################

export PYTHONPATH=/opt/local/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages
export PYTHONSTARTUP=~/.pythonrc.py

# [ -z ${TMUX} ]
#[ -x $(which tmux) ] && [ $SHLVL = 1 ] && exec tmux
