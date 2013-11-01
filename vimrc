" Rafael Barbosa .vimrc
" Inspired by Jeremy Mack and Gary Bernhardt

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

" Ctrl-P
Bundle 'kien/ctrlp.vim'

" Powerline
Bundle 'Lokaltog/vim-powerline'

" Themes
Bundle 'nanotech/jellybeans.vim'
Bundle 'jpo/vim-railscasts-theme'

" " Commands
" Bundle 'scrooloose/nerdcommenter'
" Bundle 'tpope/vim-surround'
" Bundle 'mileszs/ack.vim'
" Bundle 'ervandew/supertab'
" Language Additions
" Bundle 'vim-ruby/vim-ruby'
" Bundle 'tpope/vim-rails'
" Bundle 'pangloss/vim-javascript'
" Bundle 'kchmck/vim-coffee-script'
" Bundle 'leshill/vim-json'
" Bundle 'itspriddle/vim-jquery'
" Bundle 'mutewinter/nginx.vim'
" Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
" Bundle 'hallison/vim-markdown'

" ----------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ----------------------------------------

" allow unsaved background buffers and remember marks/undo for them
set hidden
" remember more commands and search history
set history=10000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
set cmdheight=2
set switchbuf=useopen
set numberwidth=5
set showtabline=2
set winwidth=79
" This makes RVM work inside Vim. I have no idea why.
set shell=bash
" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
set scrolloff=3
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" Enable highlighting for syntax
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
let mapleader=","
" Fix slow O inserts
:set timeout timeoutlen=1000 ttimeoutlen=100
" Show line numbers
set number

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  autocmd FileType python set sw=4 sts=4 et

  autocmd! BufRead,BufNewFile *.sass setfiletype sass

  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  " Indent p tags
  autocmd FileType html,eruby if g:html_indent_tags !~ '\\|p\>' | let g:html_indent_tags .= '\|p\|li\|dt\|dd' | endif

  " Don't syntax highlight markdown because it's often wrong
  autocmd! FileType mkd setlocal syn=off

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()
augroup END

filetype plugin indent on  " Automatically detect file types. (must turn on after Vundle)

" ---------------
" Color
" ---------------
:set t_Co=256 " 256 colors
:set background=dark
:color jellybeans

" ---------------
" Backups
" ---------------
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" ---------------
" UI
" ---------------
"set ruler  " Ruler on
"set nowrap  " Line wrapping off
"set encoding=utf-8

" ---------------
" Behaviors
" ---------------
"syntax enable
"set autoread           " Automatically reload changes if detected
"set wildmenu           " Turn on WiLd menu
"set hidden             " Change buffer - without saving
"set history=768        " Number of things to remember in history.
"set cf                 " Enable error files & error jumping.
"set clipboard+=unnamed " Yanks go on clipboard instead.
"set autowrite          " Writes on make/shell commands
"set timeoutlen=350     " Time to wait for a command (after leader for example)
"set foldlevelstart=99  " Remove folds
"set formatoptions=crql

" ---------------
" Text Format
" ---------------
"set tabstop=2
"set backspace=2 " Delete everything with backspace
"set shiftwidth=2  " Tabs under smart indent
"set cindent
"set autoindent
"set smarttab
"set expandtab
"set backspace=2

" ---------------
" Searching
" ---------------
" nnoremap / /\v
" vnoremap / /\v
" set ignorecase
" set smartcase
" set gdefault
" set incsearch
" set showmatch
" set hlsearch
"
nnoremap <leader><space> :noh<cr>
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache,*.class,.tags

" ---------------
" Visual
" ---------------
set showmatch  " Show matching brackets.
" set matchtime=2 " How many tenths of a second to blink

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" Better complete options to speed it up
set complete=.,w,b,u,U

"""""""""""""""""""""""""""""""
" MISC KEY MAPS
"""""""""""""""""""""""""""""""
map <leader>y "*y
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Window Movement
" nmap <silent> <C-h> :wincmd h<CR>
" nmap <silent> <C-j> :wincmd j<CR>
" nmap <silent> <C-k> :wincmd k<CR>
" nmap <silent> <C-l> :wincmd l<CR>
" Previous Window
" nmap <silent> <C-p> :wincmd p<CR>

" Can't be bothered to understand ESC vs <c-c> in insert mode
imap <c-c> <esc>
" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()
nnoremap <leader><leader> <c-^>
" Close all other windows, open a vertical split, and open this file's test
" alternate in it.
nnoremap <leader>s <c-w>o <c-w>v <c-w>w :call OpenTestAlternate()<cr>

" Equal Size Windows
nmap <silent> <leader>w= :wincmd =<CR>

" Window Splitting
nmap <silent> <leader>sh :split<CR>
nmap <silent> <leader>sv :vsplit<CR>
nmap <silent> <leader>sc :close<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" -------------
" My stuff
" -------------
imap jj <ESC>
