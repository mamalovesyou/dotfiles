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

./update_conf.sh

