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
sudo sh -c 'echo $(which zsh) >> /etc/shells' && chsh -s $(which zsh) 
echo "Reboot to apply zsh as defaut" 
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

./update_conf.sh
