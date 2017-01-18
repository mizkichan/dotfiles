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
		slock
		;;
	logout)
		i3-msg exit
		;;
	restart)
		i3-msg restart
		;;
	hibernate | suspend)
		slock systemctl $result -i
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
