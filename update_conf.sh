#!/usr/bin/env bash
#
# Update conf for:
#	- zsh
#	- vim
#	- tmux
#	- editorconfig


# Update ZSH config file .zshrc
cp -rf .zshrc $HOME/.zshrc

mkdir -p $HOME/.vim/bundle
mkdir -p $HOME/.vim/config

if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
	echo "Vundle.vim does not exist, we'll install it!"
	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

cp -rf plugins.vim $HOME/.vim/config/plugins.vim
cp -rf go.vim $HOME/.vim/config/go.vim
cp -rf python.vim $HOME/.vim/config/python.vim
cp -rf nerdtree.vim $HOME/.vim/config/nerdtree.vim

cp -rf .tmux.conf $HOME/.tmux.conf

cp -rf .editorconfig $HOME/.editorconfig

# Check OS and update bindings
# Current conf is for os x so we need to update if for ubuntu
if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	echo "Updating bindings for Linux..."
	cp -rf linux_vimrc $HOME/.vimrc
elif [ "$(uname)" == "Darwin" ]; then
	echo "Updating bindings for OSX"
	cp -rf darwin_vimrc $HOME/.vimrc

	echo "Updating tmux config for OSX"
	cp -rf .tmux-osx.conf $HOME/.tmux-osx.conf
fi


echo "Run :PluginInstall in vim to finish"
