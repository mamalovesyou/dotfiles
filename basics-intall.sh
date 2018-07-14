#!/bin/sh

#Install CURL GIT TMUX VIM

# ADD Umake  repo
sudo add-apt-repository ppa:lyzardking/ubuntu-make
sudo apt-get update

sudo apt-get install -y curl
sudo apt-get install -y git
sudo apt-get install -y tmux
sudo apt-get install -y ubuntu-make
sudo apt-get install -y vim

# Setup tmux conf
cp .tmux.conf ~/.tmux.conf

# Setup vim conf
cp .vimrc ~/.vimrc 
