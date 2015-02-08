#!/bin/sh
target=$(zenity --list --hide-column 1 --hide-header --column= --column=\
	restart "Restart i3"\
	reboot Reboot\
	poweroff Shutdown\
	suspend Suspend\
	hibernate Hibernate)
if [ $? -eq 0 ]; then
	case $target in
		restart)
			i3-msg restart
		;;
		*)
			# password=$(zenity --password)
			# if [ $? -eq 0 ]; then
				if [ $target == hibernate ]; then
					slimlock &
				fi
				# echo $password | sudo -S systemctl $target
				systemctl $target
			# fi
		;;
	esac
fi
