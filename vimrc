" =======================================
" Who: Jeremy Mack (@mutewinter)
" What: .vimrc of champions
" Version: 1.0 (this may never change because who versions dot files,
" honestly)
" =======================================

" ----------------------------------------
" Vundle
" ----------------------------------------

set nocompatible " be iMproved
filetype off     " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" ---------------
" Plugin Bundles
" ---------------

Bundle 'kien/ctrlp.vim'
" " UI Additions
Bundle 'Lokaltog/vim-powerline'
" Bundle 'scrooloose/nerdtree'

" " Commands
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
" Bundle 'tpope/vim-fugitive'
" Bundle 'godlygeek/tabular'
Bundle 'mileszs/ack.vim'
" Bundle 'gmarik/sudo-gui.vim'
" Bundle 'milkypostman/vim-togglelist'
" " Automatic Helpers
" Bundle 'IndexedSearch'
" Bundle 'xolox/vim-session'
" Bundle 'Raimondi/delimitMate'
" Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
" Bundle 'gregsexton/MatchTag'
" Bundle 'Shougo/neocomplcache'
" " Language Additions
" "   Ruby
Bundle 'vim-ruby/vim-ruby'
" Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-rails'
" Bundle 'tpope/vim-rake'
" "   JavaScript
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'itspriddle/vim-jquery'
" "   Other Languages
" Bundle 'msanders/cocoa.vim'
" Bundle 'mutewinter/taskpaper.vim'
Bundle 'mutewinter/nginx.vim'
" Bundle 'timcharper/textile.vim'
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
" Bundle 'acustodioo/vim-tmux'
" Bundle 'hallison/vim-markdown'
" Bundle 'xhtml.vim--Grny'
" " MatchIt
" Bundle 'matchit.zip'
" Bundle 'kana/vim-textobj-user'
" Bundle 'nelstrom/vim-textobj-rubyblock'
" " Libraries
" Bundle 'L9'
" Bundle 'tpope/vim-repeat'
" Bundle 'tomtom/tlib_vim'

filetype plugin indent on  " Automatically detect file types. (must turn on after Vundle)

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=","

" ---------------
" Color
" ---------------
set background=dark
colorscheme jellybeans

" GVIM

set lines=60
set columns=120

" Custom Menlo font for Powerline
" From: https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts
set guifont=DejaVu\ Sans\ Mono\ Bold\ 12

" Hide Toolbar in MacVim
if has("gui_running")
  set guioptions=egr
  colorscheme railscasts
endif

" Use option (alt) as meta key.
" set macmeta


" ----------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ----------------------------------------


" ---------------
" Backups
" ---------------
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" ---------------
" UI
" ---------------
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set laststatus=2  " Always show the statusline
set cmdheight=2
set encoding=utf-8

" ---------------
" Behaviors
" ---------------
syntax enable
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
set timeoutlen=350     " Time to wait for a command (after leader for example)
set foldlevelstart=99  " Remove folds
set formatoptions=crql
set t_Co=256           " Colors

" ---------------
" Text Format
" ---------------
set tabstop=2
set backspace=2 " Delete everything with backspace
set shiftwidth=2  " Tabs under smart indent
set cindent
set autoindent
set smarttab
set expandtab
set backspace=2

" ---------------
" Searching
" ---------------
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch

nnoremap <leader><space> :noh<cr>
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache,*.class,.tags

" ---------------
" Visual
" ---------------
set showmatch  " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" ---------------
" Mouse
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

" Better complete options to speed it up
set complete=.,w,b,u,U

" ----------------------------------------
" Bindings
" ----------------------------------------
" Fixes common typos
command W w
command Q q
map <F1> <Esc>
imap <F1> <Esc>

" Removes doc lookup binding because it's easy to fat finger
nmap K k
vmap K k

" Make line completion easier
imap <C-l> <C-x><C-l>

" Easier Scrolling (think j/k with left hand)
" All variations are mapped for now until I get used to one
" C/M/D + d (page up)
" C/M/D + f (page down)
nmap <C-d> <C-b>
if has("gui_macvim")
  nmap <D-f> <C-f>
  nmap <D-d> <C-b>
else
  nmap <M-f> <C-f>
  nmap <M-d> <C-b>
endif

" Use ; for : in normal and visual mode, less keystrokes
nnoremap ; :
vnoremap ; :
" double percentage signin command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" ---------------
" Leader Commands
" ---------------

" Toggle spelling mode with ,s
" nmap <silent> <leader>s :set spell!<CR>
" Edit vimrc with ,v
nmap <silent> <leader>v :e ~/.vim/vimrc<CR>

" Window Movement
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
" Previous Window
nmap <silent> <C-p> :wincmd p<CR>

" Equal Size Windows
nmap <silent> <leader>w= :wincmd =<CR>

" Window Splitting
nmap <silent> <leader>sh :split<CR>
nmap <silent> <leader>sv :vsplit<CR>
nmap <silent> <leader>sc :close<CR>

" ----------------------------------------
" Auto Commands
" ----------------------------------------

if has("autocmd")
  " No formatting on o key newlines
  autocmd BufNewFile,BufEnter * set formatoptions-=o

  " No more complaining about untitled documents
  autocmd FocusLost silent! :wa

  " When editing a file, always jump to the last cursor position.
  " This must be after the uncompress commands.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line ("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif
" ----------------------------------------
" Plugin Configuration
" ----------------------------------------

" ----------------------------------------
" Functions
" ----------------------------------------

" ---------------
" Fix Trailing White Space
" ---------------
map <leader>ws :%s/\s\+$//e<CR>
command! FixTrailingWhiteSpace :%s/\s\+$//e

" -------------
" Ack
" -------------

" ACK
" Use Ack instead of grep
set grepprg=ack

" ,a to Ack
nnoremap <leader>a :Ack

" Rotating among results in an ack search
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" -------------
" My stuff
" -------------
imap jj <ESC>
