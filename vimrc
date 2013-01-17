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
set history=50
set nrformats=alpha
set clipboard+=unnamed
set ttyfast
set lazyredraw
set linebreak

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
set statusline+=%-1.3n\                      " buffer number
set statusline+=%{fugitive#statusline()}\    " git branch
set statusline+=%f\                          " file name
set statusline+=%=                           " right align
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]\             " file format
"set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
"set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-3.14(%l,%c%V%)\ %<%p%%      " offset

" Enable CursorLine
set cursorline
highlight  CursorLine ctermbg=None ctermfg=None term=underline

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
let NERDTreeIgnore=['.DS_Store']
nnoremap <f2> :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Fugitive
nnoremap <leader>vs :Gstatus<cr>
nnoremap <leader>vw :Gwrite<cr>

" save file
nnoremap <silent> <leader><leader> :write<cr>
nnoremap <silent> <leader>s :write<cr>

" Shortcuts for editing
nnoremap <silent> <leader>q :%s/[ \t]\+$//<CR>
imap <c-l> <space>=><space>
vnoremap <silent> > >gv
vnoremap <silent> < <gv
" imap ii <C-[>

" Commands
command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

