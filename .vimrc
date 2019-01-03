set nocompatible              " be iMproved, required
filetype off                  " required


" ENABLE LINE NUMBERS
set number

" SET 256 colors 
set term=screen-256color

" Moving line shortcuts
" On osx Alt key dosen't work
" <ALT+j> ==> <ALT-j> 
" <ALT+k> ==> <ALT-k> 
nnoremap <ALT-j> :m .+1<CR>==
nnoremap <ALT-k> :m .-2<CR>==

inoremap <ALT-j> <Esc>:m .+1<CR>==gi
inoremap <ALT-k> <Esc>:m .-2<CR>==gi

vnoremap <ALT-j> :m '>+1<CR>gv=gv
vnoremap <ALT-k> :m '<-2<CR>gv=gv

" Veundle plugins
so ~/.vim/config/plugins.vim
so ~/.vim/config/nerdtree.vim
so ~/.vim/config/go.vim


syntax on

" Color scheme
colorscheme codedark 

filetype plugin indent on    " required
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

