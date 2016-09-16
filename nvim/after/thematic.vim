" call dein#add('reedes/vim-thematic'
" call dein#add('yjpark/molokai'

"nnoremap <silent> <D-9> <Plug>ThematicNarrow
"nnoremap <silent> <D-0> <Plug>ThematicWiden

let g:thematic#defaults = {
\ 'background': 'dark',
\ 'laststatus': 2,
\ 'ruler': 0,
\
\ 'typeface': 'Sauce Code Powerline Light',
\ 'font-size': 16,
\ 'transparency': 0,
\ 'linespace': 6,
\ 'fullscreen': 0,
\ }

let g:thematic#themes = {
\ 'code_pencil' :{
\   'colorscheme': 'pencil',
\   'airline-theme': 'pencil',
\ },
\
\ 'code_molokai' :{
\   'colorscheme': 'molokai',
\   'airline-theme': 'molokai',
\   'font-size': 14,
\   'linespace': 3,
\ },
\
\ 'code_pencil_small' :{
\   'colorscheme': 'pencil',
\   'airline-theme': 'pencil',
\   'font-size': 12,
\   'linespace': 3,
\ },
\
\ 'write' :{
\   'colorscheme': 'pencil',
\   'airline-theme': 'pencil',
\   'laststatus': 0,
\   'ruler': 1,
\   'background': 'light',
\ },
\ }

let g:thematic#theme_name = 'code_molokai'
