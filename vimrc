" enable pathogen bundles
call pathogen#infect()
call pathogen#helptags()

set nocompatible
filetype plugin indent on

" enable match it support
runtime macros/matchit.vim

" allow using the mouse to select text
if has('mouse')
    set mouse=a
    set selectmode=mouse
endif

syntax enable on
set background=dark
colorscheme vividchalk
highlight LineNr ctermfg=yellow ctermbg=black

let mapleader=","

" setup searching
set ignorecase hlsearch incsearch
nnoremap <cr> :nohlsearch<cr>

"other
set showmode
set backspace=indent,eol,start

if $TMUX == ''
    set clipboard+=unnamed
endif

" Setup tabbing to be 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set copyindent
set shiftround

" Place created files in a common place
set backup
set writebackup
set swapfile
set backupdir=~/tmp/vim/backup
set directory=~/tmp/vim/tmp

if &t_ts != ''
    set title
endif

" Status line
set laststatus=2
set shortmess=Ia
set number
set showcmd
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%{fugitive#statusline()}\    " git brnahc
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
    set guifont=Monaco:h14
	autocmd FocusGained * set transparency=3
	autocmd FocusLost * set transparency=50
end

if has('gui_running')
    set lines=40
    set columns=130
endif

if has("multi_byte")
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
  if &termencoding == ""
    let &termencoding = &encoding
  endif
end

" makegreen settings for rspec
autocmd FileType cucumber compiler cucumber | setl makeprg=cucumber\ \"%:p\"
autocmd BufNewFile,BufRead *_spec.rb compiler rspec
map <Leader>g :call MakeGreen()<cr>

" Tagbar
nmap <f3> :TagbarToggle<cr>

" CtrlP
let g:ctrlp_max_files = 20000
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$|\.tmp$'

" NERDTree
nnoremap <f2> :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Fugitive
nnoremap <leader>vs :Gstatus<cr>
nnoremap <leader>vw :Gwrite<cr>

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
nnoremap <silent> <C-s-up> :call <SID>swap_up()<CR>
nnoremap <silent> <c-s-down> :call <SID>swap_down()<CR>

" save file
nnoremap <silent> <leader>s :write<cr>

" Shortcuts for editing
nnoremap <silent> <leader>o :pu_<CR>
nnoremap <silent> <leader>O :pu!_<CR>
imap <c-l> <space>=><space>
vnoremap <silent> > >gv
vnoremap <silent> < <gv
imap ii <C-[>
