# Personnal bindings for zsh
plugins=(
	tmux
	vi-mode
	git
)

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export GOPATH=$HOME/go
export GOBIN=$HOME/go/bin

export KEYTIMEOUT=1

# Use vim bindings in zsh
bindkey -v

ZSH_TMUX_AUTOSTART=true
ZSH_THEME="robbyrussell"

# Has to be the last line
source $HOME/.oh-my-zsh/oh-my-zsh.sh

# Fuzzy file finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--bind j:down,k:up'
