#!/bin/sh
sh -c "$(
    zenity --title Exit --width 320 --height 240 \
           --list --text= --column= --hide-column 1 --hide-header \
           --column= \
           "i3-msg restart" "Restart i3" \
           "i3-msg exit" "Logout" \
           "systemctl reboot" "Reboot" \
           "systemctl poweroff" "Shutdown" \
           "systemctl suspend" "Suspend" \
           "slock ; systemctl hibernate" "Hibernate" \
           "mpv --fs --mute --loop inf --start 16.0 --ab-loop-a 16.0 --ab-loop-b 22.2 $HOME/video/panda_office.mkv" "Panda!!!")"
