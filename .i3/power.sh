#!/bin/sh
result=$(dmenu -l 20 <<EOI

hibernate
lock
logout
poweroff
reboot
restart
shutdown
suspend
boot windows
EOI
)

case $result in
	lock)
		swaylock
		;;
	logout)
		swaymsg exit
		;;
	restart)
		swaymsg restart
		;;
	hibernate | suspend)
		slock systemctl $result
		;;
	"boot windows")
		sudo -A efibootmgr -n 0000
		[ $? -eq 0 ] && systemctl reboot
		;;
	"")
		;;
	*)
		systemctl $result
		;;
esac
