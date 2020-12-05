#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
export XDG_RUNTIME_DIR=/run/user/dmr

. /etc/X11/Xsession


setxkbmap -option terminate:ctrl_alt_bksp
xset -b b off
xset b 0 0 0
xset -solid black
xset fp rehash
fc-cache

if [ -f $HOME/.Xresources ]; then
  xrdb -l $HOME/.Xresources
fi

if [ -f $HOME/.Xdefaults ]; then
  xrdb -m $HOME/.Xdefaults
fi

if [ -f $HOME/.Xmodmap ]; then
  xmodmap $HOME/.Xmodmap
fi

eval `ssh-agent`


exec /usr/bin/i3

