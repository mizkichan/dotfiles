# .xinitrc

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

export LANG=ja_JP.UTF-8

export GTK_IM_MODULE=uim
export QT_IM_MODULE=uim
export XMODIFIERS=@im=uim

export GTK2_RC_FILES=/usr/share/themes/HighContrast/gtk-2.0/gtkrc
export GTK_THEME=HighContrast

setxkbmap -layout jp &
[ -f ~/.Xresources ]	&& xrdb ~/.Xresources &
[ -f ~/.xmodmaprc ]	&& xmodmap ~/.xmodmaprc &
display -window root -backdrop /usr/share/archlinux/wallpaper/archlinux-simplyblack.png &
wait

uim-xim &
uim-toolbar-gtk-systray &
dropbox &
syndaemon -i 1 -t -k &
ibamtray &
volumeicon &

exec i3
