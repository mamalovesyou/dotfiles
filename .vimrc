" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set nocompatible
filetype off                  " required


set number " ENABLE LINE NUMBERS
set hlsearch " ENABLE highlight when search
set term=screen-256color " SET 256 colors 

" Disable the arrow keys

noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" Moving line shortcuts
" On osx Alt key dosen't work
" <ALT+j> ==> ∆ 
" <ALT+k> ==> ˚ 
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==

inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi

vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Vundle plugins
so ~/.vim/config/plugins.vim
so ~/.vim/config/nerdtree.vim
so ~/.vim/config/go.vim
so ~/.vim/config/python.vim


syntax on

" Color scheme
colorscheme codedark 

filetype plugin indent on    " required

