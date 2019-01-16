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
	reattach-to-user-namespace
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
ZSH_BIN="/bin/zsh"
sudo sh -c 'echo $ZSH_BIN >> /etc/shells' && chsh -s $ZSH_BIN 
echo "Reboot to apply zsh as defaut" 

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

./update_conf.sh
