# .xinitrc

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

export LANG=ja_JP.UTF-8

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export GTK_OVERLAY_SCROLLING=0

[ -f ~/.xkeymap.xkb ] && xkbcomp ~/.xkeymap.xkb $DISPLAY
[ -f ~/.Xresources ] && xrdb ~/.Xresources

ibus-daemon -drx

exec i3

# vim: set ft=sh ts=4 sw=4:
