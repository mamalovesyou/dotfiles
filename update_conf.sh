#!/usr/bin/env bash
#
# Update conf for:
#		   - vim
#		   - tmux
#		   - editorconfig

mkdir - ~/.vim/{config, bundle}

if [ ! -f ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

cp -rf .vimrc ~/.vimrc
cp -rf plugins.vim ~/.vim/config/plugins.vim
cp -rf go.vim ~/.vim/config/go.vim
cp -rf nerdtree.vim ~/.vim/config/nerdtree.vim

cp -rf .tmux.conf ~/.tmux.conf

cp -rf .editorconfig ~/.editorconfig

echo "Run :PluginInstall in vim to finish"
