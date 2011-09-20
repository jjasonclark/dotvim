call pathogen#infect()

if has('gui_running')
    set guifont=Monaco:h14
    set lines=40
    set columns=100
    set mouse=a
    set selectmode=mouse
endif

syntax enable
colorscheme grb256
set background=light

let mapleader=","
set ic
set hlsearch
set incsearch
set ruler

set shiftwidth=4
set tabstop=4
set expandtab
set autoindent

set nobackup
set nowritebackup

syntax on
filetype plugin indent on
set number

map <c-s> :w<cr>
imap <c-s> <esc>:w<cr>a
map <c-a> ggVG

