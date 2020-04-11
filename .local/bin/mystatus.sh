#!/bin/sh
i3status | while true; do
	read line
	printf "%s [LIT %s] %s\n" "$line" "$(backlight)" "$(date +'%Y/%m/%d %H:%M:%S')"
done
