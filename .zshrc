# Personnal bindings for zsh
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

plugins=(
	tmux
	vi-mode
	git
)

export KEYTIMEOUT=1

# Use vim bindings in zsh
bindkey -v


ZSH_TMUX_AUTOSTART=true
ZSH_THEME="robbyrussell"
