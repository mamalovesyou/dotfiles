#!/usr/bin/env bash
#
# Update conf for:
#		   - vim
#		   - tmux
#		   - editorconfig

mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/config

if [ ! -f ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

cp -rf plugins.vim ~/.vim/config/plugins.vim
cp -rf go.vim ~/.vim/config/go.vim
cp -rf nerdtree.vim ~/.vim/config/nerdtree.vim

cp -rf .tmux.conf ~/.tmux.conf

cp -rf .editorconfig ~/.editorconfig

# Check OS and update bindings
# Current conf is for os x so we need to update if for ubuntu
if [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	echo "Updating bindings for Linux..."
	cp -rf linux_vimrc ~/.vimrc
elif [ "$(uname)" == "Darwin" ]; then
	echo "Updating bindings for OSX"
	cp -rf darwin_vimrc ~/.vimrc
fi


echo "Run :PluginInstall in vim to finish"
