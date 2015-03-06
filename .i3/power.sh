#!/bin/sh
$(zenity --title Exit --width 320 --height 240 \
         --list --text= --column= --hide-column 1 --hide-header \
         --column= \
         "i3-msg restart" "Restart i3" \
         "i3-msg exit" "Logout" \
         "systemctl reboot" "Reboot" \
         "systemctl poweroff" "Shutdown" \
         "systemctl suspend" "Suspend" \
         "slimlock & systemctl hibernate" "Hibernate")
