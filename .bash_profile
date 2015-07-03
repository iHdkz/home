# /etc/skel/.bash_profile:
# $Header: /virtual/aloe/cvsroot/dot.files/.bash_profile,v 1.1 2007/09/04 05:39:53 aloe Exp $
echo "reading .bash_profile ..."
# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.

# Set up Japanese environment
SHELL=$(which bash)

[[ -f ~/.profile ]] && . ~/.profile

if [[ -z ${TMUX} ]] ; then
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
	 if [[ -x $(which tmux) ]] && [[ $SHLVL = 1 ]]; then
		 tmux
	 fi
fi

if [[ -f /opt/local/etc/profile.d/bash_completion.sh ]]; then
 . /opt/local/etc/profile.d/bash_completion.sh
fi

#[[ -f ~/.bashrc ]] && . ~/.bashrc
