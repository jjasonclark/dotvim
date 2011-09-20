call pathogen#infect()

if has('gui_running')
    set guifont=Monaco:h14
    set lines=40
    set columns=100
endif

syntax enable
colorscheme grb256
set background=light

let mapleader=","
set ic
set hlsearch
set incsearch

syntax on
filetype plugin indent on
set number

