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

" makegreen settings for rspec
autocmd BufNewFile,BufRead *_spec.rb compiler rspec
map <Leader>g :call MakeGreen()<cr>

if has("gui_macvim")
	autocmd FocusGained * set transparency=3
	autocmd FocusLost * set transparency=50
end

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
end

" Swap lines function from http://stackoverflow.com/questions/741814/move-entire-line-up-and-down-in-vim
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

" move line up/down
noremap <silent> <c-s-up> :call <SID>swap_up()<CR>
noremap <silent> <c-s-down> :call <SID>swap_down()<CR>

" save file
map <c-s> :w<cr>
imap <c-s> <esc>:w<cr>a
" select all
map <c-a> ggVG

