" enable pathogen bundles
call pathogen#infect()

" enable match it support
runtime macros/matchit.vim

if has('gui_running')
    set guifont=Monaco:h14
    set lines=40
    set columns=100
endif

" allow using the mouse to select text
if has('mouse')
    set mouse=a
    set selectmode=mouse
endif

syntax enable
syntax on
colorscheme vividchalk
" colorscheme grb256
filetype plugin indent on
set background=light
set encoding=utf-8

let mapleader=","

" setup searching
set ic
set hlsearch
set incsearch
nnoremap <leader><space> :noh<cr>

"other
set showmode
set clipboard+=unnamed		"yanks to clipboard
set backspace=indent,eol,start

" Setup tabbing to be 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set copyindent
set shiftround

" Remove vim created files
set backup
set writebackup
set swapfile
set backupdir=~/tmp/vim/backup
set directory=~/tmp/vim/tmp

set shortmess=Ia
set title
set number
set ruler
set showcmd

map <c-s> :w<cr>
imap <c-s> <esc>:w<cr>a
map <c-a> ggVG

