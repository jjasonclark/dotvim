" enable pathogen bundles
call pathogen#infect()
call pathogen#helptags()

set nocompatible
filetype plugin indent on

set path=**
set wildmode=full
set wildmenu
set wildignore=.git/*

" enable match it support
runtime macros/matchit.vim

" allow using the mouse to select text
if has('mouse')
    set mouse=a
    set selectmode=mouse
endif

syntax enable on
set t_Co=256
set background=dark
colorscheme vividchalk
highlight LineNr ctermfg=yellow ctermbg=black

let mapleader=","

" setup searching
set ignorecase hlsearch incsearch
nnoremap <silent> <C-L> :nohlsearch<cr>

"other
set showmode
set backspace=indent,eol,start
set history=50
set nrformats-=octal
set clipboard+=unnamed
set ttyfast
set lazyredraw
set linebreak

" Setup tabbing to be 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set copyindent
set shiftround
set indentexpr=GetRubyIndent()

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

" CursorLine
highlight CursorLine ctermfg=None ctermbg=235
autocmd InsertEnter * highlight CursorLine ctermfg=None ctermbg=8
autocmd InsertLeave * highlight CursorLine ctermfg=None ctermbg=235
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
autocmd BufEnter * setlocal cursorline
autocmd BufLeave * setlocal nocursorline


if has("gui_macvim")
  set guifont=Monaco:h12

	" Remove all scrollbars
	set guioptions-=r
	set guioptions-=L

	" Setup GUI see through when not in focus
	autocmd FocusGained * set transparency=3
	autocmd FocusLost * set transparency=50
end

if has("multi_byte")
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
  if &termencoding == ""
    let &termencoding = &encoding
  endif
end

" Better looking list characters
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  if !has('win32') && (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8')
    let &listchars = "tab:\u21e5 ,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u00b7"
  endif
endif

" Folding settings
autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

" CtrlP
let g:ctrlp_max_files = 20000
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$|\.tmp$'

" NERDTree
let NERDTreeIgnore=['.DS_Store']
nnoremap <f2> :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Vim-gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_post_private = 1
let g:gist_get_multiplefile = 1

" Shortcuts for editing
nnoremap <silent> <leader>q :%s/[ \t]\+$//<CR>
imap <c-l> <space>=><space>
vnoremap <silent> > >gv
vnoremap <silent> < <gv
" imap ii <C-[>
map <leader>k :ls<cr>
map <leader>f :! echo % \| tr -d '\n\r' \| pbcopy<cr><cr>

" Commands
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
command! -bar -nargs=0 SudoW :silent exe "write !sudo tee % >/dev/null"|silent edit!
command! Q :quit

" File types
autocmd BufRead,BufNewFile {*.rdoc,*.md,*.mdown} set ft=markdown
autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Cheffile,config.ru} set ft=ruby
autocmd BufRead,BufNewFile *.json set ft=javascript
autocmd FileType cucumber compiler cucumber | setl makeprg=cucumber\ \"%:p\"

" Productivity shortcuts
nnoremap <silent> <leader><leader> :write<cr>
nnoremap <leader>rl :Rlib
nnoremap <leader>vs :Gstatus<cr>
nnoremap <leader>vw :Gwrite<cr>
nnoremap <silent> <leader>s :setlocal spell! spelllang=en_us<CR>
