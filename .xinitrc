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

setxkbmap -layout jp
[ -f ~/.xmodmaprc ]	&& xmodmap ~/.xmodmaprc

[ -f ~/.Xresources ]	&& xrdb ~/.Xresources &
display -window root -backdrop /usr/share/archlinux/wallpaper/archlinux-simplyblack.png &
wait

uim-xim &
uim-toolbar-gtk-systray &
dropbox &
syndaemon -i 1 -t -k &
ibamtray &
volumeicon &

exec i3

# vim: set ft=sh:
