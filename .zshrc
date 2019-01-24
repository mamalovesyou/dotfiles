# Personnal bindings for zsh
plugins=(
	tmux
	vi-mode
	git
)

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export POWERLINE=$HOME/Library/Python/2.7/lib/python/site-packages


export KEYTIMEOUT=1

# Use vim bindings in zsh
bindkey -v


ZSH_TMUX_AUTOSTART=true
ZSH_THEME="robbyrussell"

# Has to be the last line
source $HOME/.oh-my-zsh/oh-my-zsh.sh
