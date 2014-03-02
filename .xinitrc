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
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on -Dswing.crossplatformlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

setxkbmap -layout jp
[ -f ~/.Xresources ]	&& xrdb ~/.Xresources
[ -f ~/.xbindkeysrc ]	&& xbindkeys
[ -f ~/.xmodmaprc ]	&& xmodmap ~/.xmodmaprc
display -window root -backdrop /usr/share/archlinux/wallpaper/archlinux-simplyblack.png

uim-xim &
uim-toolbar-gtk-systray &

exec $1
