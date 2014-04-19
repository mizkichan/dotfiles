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

PROMPT='%n@%m%% '
PROMPT2='%_%% '
RPROMPT='%(?..:( )%~'

setopt share_history

bindkey '^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line
bindkey '^[[3~' delete-char

alias ls='ls -AbFhv --color --group-directories-first'
alias pacman='yaourt'
alias xargs='xargs '
alias rm='trash'
alias _rm='/usr/bin/rm'

eval `dircolors -b ~/.dir_colors`
