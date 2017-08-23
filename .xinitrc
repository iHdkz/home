#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

SHELL=$(which bash)
#uim-xim &
#uim-toolbar-gtk * &

setxkbmap -model jp106 -layout jp
xsetq +fp $HOME/.local/fonts/mplus
xsetq fp rehash

display -flatten -window root /usr/X11R7/include/X11/pixmaps/NetBSD-flag.png
#/usr/X11R7/include/X11/pixmaps
xclock -digital -geometry -0-0 &
/usr/X11R7/bin/xterm -fs 16 -fa "M+ 2m" -fd "M+ 2m" -geometry 115x31+0+0 -name login &
/usr/X11R7/bin/xterm -fs 16 -fa "M+ 2m" -fd "M+ 2m" &
exec ctwm

