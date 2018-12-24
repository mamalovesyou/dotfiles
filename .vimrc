set nocompatible              " be iMproved, required
filetype off                  " required


" ENABLE LINE NUMBERS
set number

" Vundle plugins
so ~/.vim/config/plugins.vim
so ~/.vim/config/go.vim

syntax on

" Color scheme
colorscheme codedark 

map <C-o> :NERDTreeToggle<CR>

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

