# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile
umask 022

# if running bash
[ -n "$BASH_VERSION" ] && [ -f "$HOME/.bashrc" ] && . $HOME/.bashrc
# include .bashrc if it exists


# set PATH so it includes user's private bin if it exists
[ -d ${HOME}/bin ] && PATH=${HOME}/bin:${PATH}
# set PATH so it includes additional installed bin if it exists
__RACKETPATH__="/Applications/Racket v6.1.1/bin" 
[ -d ${__RACKETPATH__} ]  && PATH=${__RACKETPATH__}:${PATH}

__FORTRANPATH__=/opt/local/lib/fpc/bin
[ -d ${__FORTRANPATH__} ] && PATH=${__FORTRANPATH__}:${PATH}

__HASKELLPATH__=${HOME}/Library/Haskell/bin
[ -d ${__HASKELLPATH__} ] && PATH=${__HASKELLPATH__}:${PATH}

# Finished adapting your PATH environment variable for use with MacPorts.
__MACPATH__=/opt/local
[ -d ${__MACPATH__} ] && PATH=${__MACPATH__}/bin:${__MACPATH__}/sbin:${PATH}
#### EXPORTING "PATH" ####
export PATH
##########################
[ -z "$INFOPATH" ] && export INFOPATH=${__MACPATH__}/share/info

PYTHONPATH=${__MACPATH__}/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages
PYTHONPATH=$HOME/.python.d:$PYTHONPATH
export PYTHONPATH

PYTHONSTARTUP=$HOME/.pythonrc.py
export PYTHONSTARTUP

# [ -z ${TMUX} ]
#[ -x $(which tmux) ] && [ $SHLVL = 1 ] && exec tmux
