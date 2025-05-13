set nocompatible            " disable compatibility to old-time vi
set showmode                " Show the mode you are on the last line.
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=a                 " enable mouse click
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set expandtab               " converts tabs to white space
set autoindent              " indent a new line the same amount as the line just typed
" set relativenumber
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

set termguicolors
" colorscheme peachpuff
" colorscheme habamax
set smartindent



filetype plugin on
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=4            " width for autoindents
"set cc=80                  " set an 80 column border for good coding style

