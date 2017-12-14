execute pathogen#infect()
filetype plugin indent on
syntax on

" Use the solarized dark theme. The order of these lines matters!
let g:solarized_termcolors=256
colorscheme solarized
set background=dark

" Show line numbers
set number            " show line number
set numberwidth=4     " width of number column

" Use 2 spaces instead of tabs
set tabstop=2         " Number of spaces to indent with tab key
set shiftwidth=2      " Number of space characters for indentation
set expandtab         " insert space characters for tab

" Tweak searching
set incsearch         " search as you type
set hlsearch          " highlight all search results


"syntax enable         " Syntax highlighting
"let mapleader = ","   " Set <Leader> key

"set autoindent        " Keep indentation of previous line
"set showmatch         " Highlight matching brackets
"set ruler             " Show line number on bar
"set showmode          " display the current mode
"set cursorline        " highlight the current line

" make jj do esc
inoremap jj <Esc>

" make esc do nothing
inoremap <Esc> <Nop>
