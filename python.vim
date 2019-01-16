" This is my python conf for vim
" Pep8 
au BufNewFile,BufRead *.py
    \ set encoding=utf-8
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix
    \ match BadWhitespace /\s\+$/ "This will mark extra whitespace as bad and probably color it red.
    \ set clipboard=unnamed " On OS X, you can access your system clipboard with this line
