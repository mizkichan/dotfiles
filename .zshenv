PATH=$HOME/.local/bin:$PATH
PATH=$PATH:$HOME/.gem/ruby/2.3.0/bin	# RubyGems も ~/.local/ に入れられないだろうか？
export PATH
export NODE_PATH=$HOME/.local/lib/node_modules
export EDITOR=vim
[ -z "$DISPLAY" -a "$(fgconsole)" -eq 1 ] && exec startx
