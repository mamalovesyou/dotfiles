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

for pkg in ${PACKAGES[@]}; do
    if brew ls --versions ${pkg} > /dev/null; then
		echo "Package '$pkg' is installed"
	else
		echo "Install package '$pkg' "
	fi
done

