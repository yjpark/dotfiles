set cursorline
au InsertLeave * set nocursorcolumn
au InsertEnter * set cursorcolumn

" au InsertLeave * colorscheme desert256
" au InsertEnter * colorscheme zenburn

" Cannot set this in Terminal.APP, which will blink
if $TERM_PROGRAM != 'Apple_Terminal'
    set t_Co=256
endif

set gfn=Sauce\ Code\ Powerline\ Light:h20

