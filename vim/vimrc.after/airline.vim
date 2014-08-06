NeoBundle 'yjpark/vim-airline'
" Using vim-airline for now, since powerline is a bit too much, and the font
" is not patched properly yet on my computers
" python from powerline.vim import setup as powerline_setup
" python powerline_setup()
" python del powerline_setup
" set ttimeoutlen=50
" set noshowmode
" let g:airline_theme="powerlineish"
let g:airline_powerline_fonts = 1

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number

