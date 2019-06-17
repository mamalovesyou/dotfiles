set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'itchyny/lightline.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe', { 'dir': '~/.vim/bundle/YouCompleteMe', 'do': './install.py --all' }
Plugin 'nvie/vim-flake8'
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'epilande/vim-react-snippets'
Plugin 'epilande/vim-es2015-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'junegunn/vim-easy-align'

" Typescript support
Plugin 'Quramy/tsuquyomi'
Plugin 'jason0x43/vim-js-indent'
Plugin 'leafgarland/typescript-vim'

call vundle#end()
filetype plugin indent on
