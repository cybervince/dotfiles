#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

DEFAULT_SESSION=mate-session

export PATH=$PATH:~/.local/bin

case $1 in

  mate)
	exec dbus-launch mate-session
	;;


  dwm)
	# enable restart X
	setxkbmap -option terminate:ctrl_alt_bksp &
	# disable CapsLock & map to Escape
	setxkbmap -option caps:escape &

	# set wallpaper
	nitrogen --restore &

	# set status
	while true
	do
		xsetroot -name "$( date +"%x | %R" )"
		sleep 1m
	done &

	# start the screensaver
	#xscreensaver -no-splash &

	# Dzen & conky
	#(sleep 3s && conky | dzen2 -x '950' -e '' -fg '#737373' -bg '#262626' -w '490' -h '14' -ta r -fn '-*-fixed-medium-r-*-*-12-*-*-*-*-*-iso8859-*' -p ) &
	# Start dwm
	exec dbus-launch dwm
       ;;


  awesome)
	exec dbus-launch awesome
	;;


  *)  
	exec dbus-launch $DEFAULT_SESSION
	;;

esac
