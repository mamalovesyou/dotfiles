#!/usr/bin/env bash
#
# Bootstrap script to set up a new OSX machine
#
PACKAGES=(
	bash	
	git
	vim
	tmux
	wget
	zsh
)

echo "Starting installing packages..."

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
	echo "Installing homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

for i in $PACKAGES; do
	echo "Installing: " $i
	brew install $i
done

# Set Zsh as default shell
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh

./update_conf.sh

