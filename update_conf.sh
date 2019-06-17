#!/bin/bash

# Update conf for:
#	- zsh
#	- vim
#	- tmux
#	- editorconfig


# Update ZSH config file .zshrc
cp -rf .zshrc $HOME/.zshrc
cp -rf .zsh_aliases $HOME/.zsh_aliases

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

echo "Running :PluginInstall in vim to finish"
vim +PluginInstall +qall

cp -rf .tmux.conf $HOME/.tmux.conf

cp -rf .editorconfig $HOME/.editorconfig

YCM_DIR=$HOME/.vim/bundle/YouCompleteMe
if [ -d YCM_DIR ]; then
    echo "Compile YouCompleteMe"
    cd YCM_DIR && python3 install.py --go-completer --ts-completer --java-completer

fi


echo "Sourcing .zshrc"
source ~/.zshrc

echo "Don't forget to set use Option as Meta key if running OSX"
