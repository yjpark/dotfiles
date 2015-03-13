let g:tex_flavor='latex'

let g:py_select_trailing_comments=0

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplUseSingleClick = 1

let g:vimim_shuangpin_microsoft=1
"let g:vimim_tab_for_one_key=1
" imap <silent><C-L> <Plug>VimimChineseToggle

set ignorecase smartcase

set wildignore+=*.meta

" Disable the automatic linebreak in markdown files
au FileType markdown set textwidth=0
" Disable all automatic linebreak
set textwidth=0

let g:plantuml_executable_script='plantuml-make'

" Multiple select plugin
" Not working yet
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='\<C-r>'
let g:multi_cursor_prev_key='\<C-l>'
let g:multi_cursor_skip_key='\<C-m>'
let g:multi_cursor_quit_key='\<Esc>'

" Use silver search over ack
" let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ackprg = 'ag --nogroup --nocolor --column --smart-case --ignore=*.meta'

" for the window control of TabBar
let g:Tb_MaxSize = 0
" let g:Tb_MoreThanOne = 0
" let g:Tb_ModSelTarget = 1

" QuickfixsignsDisable

"golint httpYJPark//github.com/golang/lint
set rtp+=~/.go/src/github.com/golang/lint/misc/vim
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
