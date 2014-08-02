set cursorline
au InsertLeave * set nocursorcolumn
au InsertEnter * set cursorcolumn

" au InsertLeave * colorscheme desert256
" au InsertEnter * colorscheme zenburn

" Cannot set this in Terminal.APP, which will blink
if $TERM_PROGRAM != 'Apple_Terminal'
    set t_Co=256
endif

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    " Do Mac stuff here
    " set gfn=Anonymous\ Pro\ for\ Powerline:h20
    set gfn=Sauce\ Code\ Powerline:h20
  else
    " Do Linux stuff here
    let g:solarized_termcolors=16
    set gfn=Bitstream\ Vera\ Sans\ Mono\ 16
  endif
endif

set background=dark
colorscheme pencil
let g:airline_theme = 'pencil'

