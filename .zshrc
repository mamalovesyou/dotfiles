# Personnal bindings for zsh

# Path to your oh-my-zsh installation.
export ZSH=/Users/berger/.oh-my-zsh

plugins=(
	tmux
	vi-mode
	git
)

export KEYTIMEOUT=1

# Use vim bindings in zsh
bindkey -v

source $ZSH/oh-my-zsh.sh

ZSH_THEME="robbyrussell"
