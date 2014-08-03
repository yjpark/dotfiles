NeoBundle 'reedes/vim-thematic'

"nnoremap <silent> <D-9> <Plug>ThematicNarrow
"nnoremap <silent> <D-0> <Plug>ThematicWiden

let g:thematic#defaults = {
\ 'background': 'dark',
\ 'laststatus': 2,
\ 'ruler': 0,
\
\ 'typeface': 'Sauce Code Powerline Light',
\ 'font-size': 20,
\ 'transparency': 0,
\ 'linespace': 6,
\ 'fullscreen': 1,
\ }

let g:thematic#themes = {
\ 'code' :{
\   'colorscheme': 'pencil',
\   'airline-theme': 'pencil',
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

let g:thematic#theme_name = 'code'
