# /etc/skel/.bash_profile:
# $Header: /virtual/aloe/cvsroot/dot.files/.bash_profile,v 1.1 2007/09/04 05:39:53 aloe Exp $
echo "reading .bash_profile ..."
# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.

# Set up Japanese environment
SHELL=$(which bash)

[[ -f ~/.profile ]] && . ~/.profile


if [[ -f /opt/local/etc/profile.d/bash_completion.sh ]]; then
 . /opt/local/etc/profile.d/bash_completion.sh
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
