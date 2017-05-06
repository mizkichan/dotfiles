# .xinitrc

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

export LANG=ja_JP.UTF-8

export GTK_IM_MODULE=uim
export XMODIFIERS=@im=uim
export QT_IM_MODULE=uim

export GTK_OVERLAY_SCROLLING=0
export _JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=gasp'

[ -f ~/.xkeymap.xkb ]	&& xkbcomp ~/.xkeymap.xkb $DISPLAY
[ -f ~/.Xresources ]	&& xrdb ~/.Xresources

uim-xim &
uim-toolbar-gtk-systray &
ibamtray &
volumeicon &

exec i3

# vim: set ft=sh:
