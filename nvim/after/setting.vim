set sidescroll=8
set sidescrolloff=8

" allow backspace and cursor keys to cross line boundaries
set whichwrap+=<,>,h,l,[,]
" Don't know why need both of them to make it work

set wrap

" set autoindent      "Keep indentation from previous line
" set smartindent     "Automatically inserts indentation in some cases
" set cindent         "Like smartindent, but stricter and more customisable

behave xterm

" The ttymouse is for vim in screen's mouse support
" set ttymouse=xterm2
set mousefocus

" make backspace work normal (indent, eol, start)
" set backspace=2

" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamed

" To allow showing GBK files properly
" http://blog.csdn.net/nyist327/article/details/38873739
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

set showmatch                                       "automatically highlight matching braces/brackets/etc.
set matchtime=2                                     "tens of a second to show matching parentheses
set number
set lazyredraw
set laststatus=2
set noshowmode

set cursorline
autocmd WinLeave * setlocal nocursorline
autocmd WinEnter * setlocal cursorline

set nocursorcolumn
autocmd InsertLeave * setlocal nocursorcolumn
autocmd InsertEnter * setlocal cursorcolumn

if $SHELL =~ '/fish$'
" VIM expects to be run from a POSIX shell.
  set shell=sh
endif

set noshelltemp                                     "use pipes

" whitespace
set backspace=indent,eol,start                      "allow backspacing everything in insert mode
set autoindent                                      "automatically indent to match adjacent lines
set expandtab                                       "spaces instead of tabs
set smarttab                                        "use shiftwidth to enter tabs
set list                                            "highlight whitespace
set listchars=tab:│\ ,trail:•,extends:❯,precedes:❮
set shiftround
set linebreak

set scrolloff=1                                     "always show content after scroll
set scrolljump=5                                    "minimum number of lines to scroll
set display+=lastline
set wildmenu                                        "show list for autocomplete
set wildmode=longest:full
set wildignorecase

set splitbelow
set splitright

" disable sounds
set noerrorbells
set novisualbell
set t_vb=

" searching
set hlsearch                                        "highlight searches
set incsearch                                       "incremental searching
set ignorecase                                      "ignore case for searching
set smartcase                                       "do case-sensitive if there's a capital letter

set hidden                                          "allow buffer switching without saving

