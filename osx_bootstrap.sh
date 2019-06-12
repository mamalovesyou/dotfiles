#!/usr/bin/env bash
#
# Bootstrap script to set up a new OSX machine
# Install brew if needed
echo "Starting bootstrapping"
# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

PACKAGES=(
	bash
	git
	vim
	tmux
	wget
	zsh
    python3
	reattach-to-user-namespace
    git-flow-avh
)

# Upating brew
brew update

echo "Installing packages..."
for pkg in ${PACKAGES[@]}; do
    if brew ls --versions ${pkg} > /dev/null; then
		echo "Package $pkg is installed"
	else
		echo "Installing  package $pkg "
        brew install $pkg
	fi
done


# Clean up brew...
echo "Cleaning up..."
brew cleanup

echo "Installing cask..."
brew install caskroom/cask/brew-cask

CASKS=(
    iterm2
    skype
    slack
    vlc
)

echo "Installing cask apps..."
for pkg in ${CASKS[@]}; do
    if brew ls --versions ${pkg} > /dev/null; then
        echo "App $pkg is installed"
	else
		echo "Installing app $pkg "
        brew cask install $pkg
	fi
done

echo "Installing fonts..."
brew tap caskroom/fonts
FONTS=(
    font-roboto
    font-clear-sans
)
for pkg in ${FONTS[@]}; do
    if brew ls --versions ${pkg} > /dev/null; then
        echo "Font $pkg is installed"
	else
		echo "Installing  font $pkg "
        brew cask install $pkg
	fi
done

echo "Installing Python packages..."
PYTHON_PACKAGES=(
    virtualenv
)
sudo pip install ${PYTHON_PACKAGES[@]}

echo "Configuring OSX..."
# Enable tap-to-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# Disable "natural" scroll
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Set Zsh as default shell
ZSH_BIN="/bin/zsh"
sudo sh -c 'echo $ZSH_BIN >> /etc/shells' && chsh -s $ZSH_BIN
echo "Reboot to apply zsh as defaut"

# Install oh-my-zsh
OHMYZSH="${HOME}/.oh-my-zsh/"
if [ ! -d "$OHMYZSH" ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" --unattended
fi

# Install Powerline9k
POWERLINE="${OHMYZSH}themes/powerlevel9k"
if [ ! -d "$POWERLINE" ]; then
    echo "Installing Powerline9k..."
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

