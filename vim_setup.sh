
echo "Setting up vim conf"
mkdir -p ~/.vim/{colors,config,bundle}

# Vundle installation
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp .vimrc ~/.vimrc
cp go.vim ~/.vim/config/go.vim
cp plugins.vim ~/.vim/config/plugins.vim

echo "Run :PluginInstall to finish the setup"
