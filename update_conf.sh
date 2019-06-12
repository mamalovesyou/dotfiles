#!/bin/bash

# Update conf for:
#	- zsh
#	- vim
#	- tmux
#	- editorconfig


# Update ZSH config file .zshrc
cp -rf .zshrc $HOME/.zshrc
cp -rf .zsh_aliases $HOME/aliases.sh

mkdir -p $HOME/.vim/bundle
mkdir -p $HOME/.vim/config

if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
	echo "Vundle.vim does not exist, we'll install it!"
	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

if [ ! -d $HOME/.fzf ]; then
	echo "fzf does not exist, we'll install it!"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
fi

cp -rf .vimrc $HOME/.vimrc
cp -R colors $HOME/.vim
cp -rf plugins.vim $HOME/.vim/config/plugins.vim
cp -rf go.vim $HOME/.vim/config/go.vim
cp -rf python.vim $HOME/.vim/config/python.vim
cp -rf nerdtree.vim $HOME/.vim/config/nerdtree.vim

cp -rf .tmux.conf $HOME/.tmux.conf

cp -rf .editorconfig $HOME/.editorconfig

echo "Running :PluginInstall in vim to finish"
vim +PluginInstall +qall

echo "Sourcing .zshrc"
source ~/.zshrc

echo "Don't forget to set use Option as Meta key if running OSX"
