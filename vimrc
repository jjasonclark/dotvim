" enable pathogen bundles
call pathogen#infect()
call pathogen#helptags()

set nocompatible

" enable match it support
runtime macros/matchit.vim

if has('gui_running')
    set guifont=Monaco:h14
    set lines=40
    set columns=130
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

" Activate the statusline globally
set laststatus=2
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L] 
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

if has("gui_macvim")
	autocmd FocusGained * set transparency=3
	autocmd FocusLost * set transparency=50
end

map <c-s> :w<cr>
imap <c-s> <esc>:w<cr>a
map <c-a> ggVG

" makegreen settings for rspec
autocmd BufNewFile,BufRead *_spec.rb compiler rspec
map <Leader>g :call MakeGreen()<cr>
