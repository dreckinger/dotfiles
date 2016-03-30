source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2
set nocompatible              " be iMproved, required
filetype off                  " required

map <C-n> :NERDTreeToggle<CR>
syntax enable
set encoding=utf-8
set showcmd                         " display incomplete commands

"" Whitespace
set nowrap                          " don't wrap lines
"set tabstop=4 shiftwidth=4          " a tab is two spaces (or set this to 4)
set expandtab                       " use spaces, not tabs
set backspace=indent,eol,start      " backspace through everything in insert mode
set list
set term=screen-256color            " setting colors when vim is inside tmux
" MacVim Settings
:set guifont=Monaco:h12

"" Searching
set hlsearch                        " highlight matches
set incsearch                       " incremental searching
set ignorecase                      " searches are case insensitive...
set smartcase                       " ... unless they contain at least one capital letter

"" Mappings
"Paste Mode
nmap <F9> ggVGu
"Lowercase all
nmap <F10> ggguG
nmap <F8> :TagbarToggle<CR>

"" Mapping 
let mapleader = ","                 " setting leader to , 

"" Color Scheme
"set background=dark
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme tomorrow_night          " Tomorrow Theme

" Enable fancy mode 
"let g:Powerline_symbols = 'fancy'   " Powerline
set encoding=utf-8

"set relativenumber                           " setting line numbers
set colorcolumn=81                           " line to show 81 character mark
set cursorline                               " shows the horizontal cursor line
set clipboard=unnamed
