#!/bin/sh
target=$(zenity --list --radiolist --hide-column 2 --hide-header --column= --column= --column=\
	false restart "Restart i3"\
	false reboot Reboot\
	false poweroff Shutdown\
	false suspend Suspend\
	false hibernate Hibernate)
if [ $? -eq 0 ]; then
	case $target in
		restart)
			i3-msg restart
		;;
		*)
			password=$(zenity --password)
			if [ $? -eq 0 ]; then
				if [ $target == hibernate ]; then
					slimlock &
				fi
				echo $password | sudo -S systemctl $target
			fi
		;;
	esac
fi
