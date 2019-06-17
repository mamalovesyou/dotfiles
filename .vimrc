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
set encoding=utf-8

" Disable the arrow keys

noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

"""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""
" Turn on the Wild menu
set wildmode=longest:full,full
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*/tmp/*,*.zip
" Always show current position
set ruler
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Find words as typing out search
set incsearch
" Start scrolling before cursor hits top/bottom
set scrolloff=5
" Number of lines to jump when scrolling off screen
" -# = percentage
set scrolljump=-10

""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc.
set nobackup
set nowb
set noswapfile

" Echo the full path of file being edited
nnoremap <leader>path :echo expand('%:p')<cr>


""""""""""""""""""""""""""""
" => Text, tab and indent related
" """"""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Do not expand tab for Makefiles
autocmd FileType make set noexpandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Auto indent and wrap lines
set ai
set wrap

" Set the backspace to work as expected
set backspace=2

" Auto remove trailing whitespace on write
autocmd BufWritePre * :%s/\s\+$//e

"""""""""""""""""""""""""""""""""""
" Operator Maps
" """""""""""""""""""""""""""""""""""
" " Operator maps to get inside () '' and "
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in) :<c-u>normal! F)vi)<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in} :<c-u>normal! F}vi}<cr>
onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap in] :<c-u>normal! F]vi]<cr>
onoremap in' :<c-u>normal! f'vi'<cr>
onoremap il' :<c-u>normal! F'vi'<cr>
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap il" :<c-u>normal! F"vi"<cr>

" JSX conf
let g:jsx_ext_required = 0
" Snippets REACT.JS
let g:UltiSnipsExpandTrigger="<C-l>"

" Align GitHub-flavored Markdown tables
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>

" Vundle plugins
so ~/.vim/config/plugins.vim
so ~/.vim/config/nerdtree.vim
so ~/.vim/config/go.vim
so ~/.vim/config/python.vim
so ~/.vim/config/js.vim

" FZF shortcut config
nnoremap <C-p> :Files<Cr>

if exists('$TMUX')
	autocmd BufEnter * call system("tmux rename-window '" . expand("%:t") . "'")
	autocmd VimLeave * call system("tmux setw automatic-rename")
endif

" Opening NERDTree if no file specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

syntax on

" Color scheme
set background=dark
colorscheme solarized

filetype plugin indent on

let uname = substitute(system('uname'), '\n', '', '')
if uname == "Darwin"
	" Load osx conf
    nnoremap ∆ :m .+1<CR>==
	nnoremap ˚ :m .-2<CR>==

	inoremap ∆ <Esc>:m .+1<CR>==gi
	inoremap ˚ <Esc>:m .-2<CR>==gi

	vnoremap ∆ :m '>+1<CR>gv=gv
	vnoremap ˚ :m '<-2<CR>gv=gv
endif
if uname == "Linux"
	" Load osx conf
	" Moving line shortcuts
	" On osx Alt key dosen't work
	" <M-j> ==> ∆
	" <M-k> ==> ˚
	nnoremap <M-j> :m .+1<CR>==
	nnoremap <M-k> :m .-2<CR>==
	inoremap <M-j> <Esc>:m .+1<CR>==gi
	inoremap <M-k> <Esc>:m .-2<CR>==gi
	vnoremap <M-j> :m '>+1<CR>gv=gv
	vnoremap <M-k> :m '<-2<CR>gv=gv
endif



