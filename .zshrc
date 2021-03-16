# .zshrc

# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall

################
# Options
################

# Changing Directories
setopt AUTO_PUSHD # 自動で pushd する
# Completion
setopt COMPLETE_IN_WORD # 単語の途中から補完できるようにする
# History
setopt EXTENDED_HISTORY  # 日時情報を付加して履歴を保存する
setopt HIST_IGNORE_SPACE # 空白で始まる履歴を保存しない
setopt HIST_IGNORE_DUPS  # 重複する履歴を保存しない
setopt HIST_VERIFY       # 履歴呼び出しを直接実行しない
setopt SHARE_HISTORY     # 異るシェルインスタンス間で履歴を共有する
# I/O
unsetopt CLOBBER            # リダイレクト時に既存ファイルを上書きできないようにする
setopt CORRECT              # コマンドのスペルミス訂正をする
setopt CORRECT_ALL          # 引数のスペルミス訂正をする
setopt IGNORE_EOF           # Ctrl-D で終了しない
setopt INTERACTIVE_COMMENTS # 対話モードでもコメントを有効にする
setopt PRINT_EXIT_VALUE     # 終了コードを表示する

################
# Prompt
################
autoload -U colors && colors
PROMPT="%n@%m%# "
PROMPT2="%_%# "
RPROMPT="%(?..%{$fg[red]%}:(%{$reset_color%} )%~ [%D{%y/%m/%d %H:%M:%S}]"
PROMPT_EOL_MARK="%B%S$%s%b"

################
# Aliases
################
alias ls="ls -AbFhkv --color --group-directories-first"
alias ll="ls -l"
alias xargs="xargs "
alias rm="rm -I"

################

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
bindkey -e

[ -e "/usr/share/doc/pkgfile/command-not-found.zsh" ] && source /usr/share/doc/pkgfile/command-not-found.zsh
[ -e "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -e "/usr/share/fzf/key-bindings.zsh" ] && source /usr/share/fzf/key-bindings.zsh
[ -e "/usr/share/fzf/completion.zsh" ] && source /usr/share/fzf/completion.zsh

LANG=en_US.UTF-8

# tmux menu
if type tmux >/dev/null && [ -z "$TMUX" ] && [ "$TERM_PROGRAM" != "vscode" ] && [ -z "$VSCODE_PID" ]; then
	entries=()

	if [ "$TERM" = "linux" ]; then
		entries+=("startx" "startx")
	fi

	tmux list-session | while read -r session; do
		session_num=$(sed 's/:.*$//' <<<"$session")
		entries+=("$session_num" "$session")
	done

	entries+=("new" "start new session")
	entries+=("no" "no tmux")

	selected=$(dialog --stdout --menu "Welcome" 0 0 0 "${entries[@]}")

	if [ "$selected" ]; then
		if [ "$selected" = "startx" ]; then
			export LANG=ja_JP.UTF-8
			exec startx
		elif [ "$selected" = "new" ]; then
			exec tmux new-session
		elif [ "$selected" != "no" ]; then
			exec tmux attach -t "$selected"
		fi
	else
		exit
	fi
fi

# vim: ts=4 sw=4
