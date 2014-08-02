set sidescroll=8
set sidescrolloff=8

set listchars+=precedes:<,extends:>

set wildmode=longest:full

" allow backspace and cursor keys to cross line boundaries
" set whichwrap+=<,>,h,l,[,]
set whichwrap+=<,>,h,l
set whichwrap+=<,>,h,l
" Don't know why need both of them to make it work

" http://stackoverflow.com/questions/6113316/how-can-i-automatically-close-preview-window-after-i-move-cursor-to-another-wind
" Not using, break the Gcommit
" autocmd WinLeave * pc

" OmniSharp won't work without this setting
filetype plugin on

set number
syntax on
set hlsearch
set incsearch

set wrap

set wildmenu

set helplang=cn

set expandtab       "Use softtabstop spaces instead of tab characters for indentation
set shiftwidth=4    "Indent by 4 spaces when using >>, <<, == etc.
set softtabstop=4   "Indent by 4 spaces when pressing <TAB>

set autoindent      "Keep indentation from previous line
set smartindent     "Automatically inserts indentation in some cases
set cindent         "Like smartindent, but stricter and more customisable

if has ("autocmd")
    " File type detection. Indent based on filetype. Recommended.
    filetype plugin indent on
endif

set foldlevelstart=99

behave xterm

" The ttymouse is for vim in screen's mouse support
set ttymouse=xterm2
set mouse=a
set mousefocus

" buffer becomes hidden when it is abandoned
set hidden

" make backspace work normal (indent, eol, start)
set backspace=2

