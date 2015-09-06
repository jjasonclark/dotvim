set nocompatible
filetype off

" start vundle
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()

Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'AndrewRadev/switch.vim'
Plugin 'AutoTag'
Plugin 'Css-Pretty'
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'austintaylor/vim-indentobject'
Plugin 'bling/vim-airline'
Plugin 'bogado/file-line'
Plugin 'burnettk/vim-angular'
Plugin 'cespare/vim-toml'
Plugin 'chrisbra/csv.vim'
Plugin 'closetag.vim'
Plugin 'ddollar/golang-template.vim'
Plugin 'docker/docker', {'rtp': '/contrib/syntax/vim/'}
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'fatih/vim-go'
Plugin 'freitass/todo.txt-vim'
Plugin 'godlygeek/tabular'
Plugin 'guns/xterm-color-table.vim'
Plugin 'jgdavey/vim-blockle'
Plugin 'kana/vim-textobj-user'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'matchit.zip'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'msanders/snipmate.vim'
Plugin 'myint/language-check'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'netrw.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'rking/ag.vim'
Plugin 'ruby-matchit'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'taq/vim-refact'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tommcdo/vim-exchange'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-jdaddy'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-rbenv'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-tbone'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vividchalk'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/JSON.vim'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'vim-scripts/text-object-left-and-right'
Plugin 'wellle/targets.vim'
Plugin 'wincent/ferret'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'

call vundle#end()

filetype plugin indent on

set path=**
set wildmode=full
set wildmenu
set wildignore=.git/*

" enable match it support
runtime plugin/matchit.vim

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
set completefunc=syntaxcomplete#Complete

" Ensure directories exist
if !isdirectory(expand("~/tmp/vim/backup"))
  silent !mkdir -p ~/tmp/vim/backup
endif
if !isdirectory(expand("~/tmp/vim/tmp"))
  silent !mkdir -p ~/tmp/vim/tmp
endif
if !isdirectory(expand("~/tmp/vim/undo"))
  silent !mkdir -p ~/tmp/vim/undo
endif

" Place created files in a common place
set backup
set writebackup
set swapfile
set undofile
set undolevels=1000
set undoreload=10000
set backupdir=~/tmp/vim/backup
set directory=~/tmp/vim/tmp
set undodir=~/tmp/vim/undo

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

" Cursor shapes
let g:use_cursor_shapes = 1
if exists("g:use_cursor_shapes") && g:use_cursor_shapes
  let &t_SI .= "\<Esc>[6 q"
  let &t_EI .= "\<Esc>[2 q"
endif

" CursorLine
highlight CursorLine ctermfg=None ctermbg=235
autocmd InsertEnter * highlight CursorLine ctermfg=None ctermbg=234
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

" Rainbow Parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" Folding settings
autocmd BufWinEnter * let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

" YouCompleteMe
let g:ycm_path_to_python_interpreter = "/usr/bin/python"
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

" Syntastic
let g:syntastic_text_checkers            = ['language_check']
let g:syntastic_text_language_check_args = '--language=en-US'
let g:syntastic_ruby_checkers            = ['rubocop', 'mri']
let g:syntastic_javascript_checkers      = ['jshint']
let g:syntastic_json_checkers            = ['jsonlint']
let g:syntastic_ruby_rubocop_exec        = '/Users/jjasonclark/source/consulting/par8o/par8o/bin/rubocop'
let g:syntastic_javascript_jshint_exec   = '/usr/local/bin/jshint'
let g:syntastic_json_jsonlint_exec       = '/usr/local/bin/jsonlint'
let g:syntastic_error_symbol             = '✗'
let g:syntastic_warning_symbol           = '⚠'
let g:syntastic_check_on_open            = 0
let g:syntastic_check_on_write           = 0
let g:syntastic_check_on_wq              = 0
let g:syntastic_enable_signs             = 1
let g:syntastic_aggregate_errors         = 0
let g:syntastic_quiet_message            = 0
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list            = 1
let g:syntastic_mode_map = {
      \ "mode": "passive",
      \ "active_filetypes": ["gitcommit"],
      \ "passive_filetypes": ["ruby", "go"] }
nnoremap <leader>i :SyntasticCheck<cr>

" delimiMate
let delimitMate_autospace = 1
let delimitMate_autoclose = 1
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
" nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
" nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Quick jump to todo file
nnoremap <leader>p :e ~/Dropbox/todo/todo.txt<CR>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j> <Plug>(unite_select_next_line)
  imap <buffer> <C-k> <Plug>(unite_select_previous_line)
endfunction

" CtrlP
let g:ctrlp_max_files = 20000
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$|\.tmp$'

" NERDTree
let NERDTreeIgnore=['.DS_Store']
nnoremap <f2> :NERDTreeFind<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NetRW
" Toggle Vexplore with Ctrl-E
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
" nnoremap <f2> :call ToggleVExplorer()<cr>

" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1

" Vim-gist
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_post_private = 1
let g:gist_get_multiplefile = 1

" vim-closetag
let g:closetag_filenames = "*.html,*.xhtml,*.erb,*.hbs"

" Tabular plugin
if exists(':Tabularize')
  AddTabularPattern! symbols         / :/l0
  AddTabularPattern! hash            /^[^>]*\zs=>/
  AddTabularPattern! chunks          / \S\+/l0
  AddTabularPattern! assignment      / = /l0
  AddTabularPattern! comma           /^[^,]*,/l1
  AddTabularPattern! colon           /:\zs /l0
  AddTabularPattern! options_hashes  /:\w\+ =>/
endif

" vim-dispatch
nnoremap <silent> <leader>rf :Focus %<cr>
nnoremap <silent> <leader>rF :Focus!<cr>
nnoremap <silent> <leader>rt :Dispatch<cr>

" Add Go Lint command
if isdirectory(expand("$GOPATH/src/github.com/golang/lint/misc/vim"))
  set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
endif

" ===============

" Shortcuts for editing
nnoremap <space> :
nnoremap <silent> <leader>q :%s/\s\+$//<CR>
imap <c-l> <space>=><space>
imap <c-j> <esc>
vnoremap <silent> > >gv
vnoremap <silent> < <gv
map <leader>k :ls<cr>
map <leader>f :! echo % \| tr -d '\n\r' \| pbcopy<cr><cr>

" Commands
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
command! -bar -nargs=0 SudoW :silent exe "write !sudo tee % >/dev/null"|silent edit!
command! Qa :qa
command! Q :quit
cnoreabbrev E e

" File types
autocmd BufRead,BufNewFile {*.rdoc,*.md,*.mdown} set filetype=markdown
autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Cheffile,config.ru,*.jbuilder} set filetype=ruby
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd FileType cucumber compiler cucumber | setl makeprg=cucumber\ \"%:p\"
autocmd FileType gitcommit setlocal spell

" Productivity shortcuts
nnoremap <silent> <leader><leader> :update<cr>
nnoremap <leader>rl :Rlib
nnoremap <leader>vs :Gstatus<cr>
nnoremap <leader>vw :Gwrite<cr>
nnoremap <silent> <leader>rx :call xmpfilter#run('n')<CR>
nnoremap <leader>sv :vsplit %:h/

" Dates
imap <Leader>ymd <C-R>=strftime("%Y-%m-%d")<CR>
imap <Leader>mdy <C-R>=strftime("%m-%d-%Y")<CR>
imap <Leader>ndy <C-R>=strftime("%b %d, %Y")<CR>
imap <Leader>ynd <C-R>=strftime("%Y %b %d")<CR>
imap <Leader>hms <C-R>=strftime("%T")<CR>

nnoremap <Leader>1 :only<CR>
