# .zshrc

# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt nomatch notify
unsetopt appendhistory autocd beep extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

PATH=$HOME/.local/bin:$PATH
PATH=$PATH:$HOME/.gem/ruby/2.1.0/bin	# RubyGems も ~/.local/ に入れられないだろうか？
export PATH

export NODE_PATH=$HOME/.local/lib/node_modules

PROMPT='%n@%m%% '
PROMPT2='%_%% '
RPROMPT='%(?..:( )%~'

setopt share_history

bindkey '^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line
bindkey '^[[3~' delete-char

alias ls='ls -A -b -h -p -X --color=auto --group-directories-first'
alias pacman='yaourt'
alias xargs='xargs '
alias rm='trash'
alias _rm='/usr/bin/rm'
