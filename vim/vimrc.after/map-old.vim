
noremap <silent> ,3 :set guioptions+=bm<CR>:set wrap<CR>
noremap <silent> ,4 :set guioptions-=bm<CR>:set nowrap<CR>
noremap ,5 :set paste<CR>
noremap ,6 :set nopaste<CR>
noremap <silent> ,7 :w<CR>:!view-latex-pdf %<CR>
noremap <silent> ,8 :set relativenumber<CR>
noremap <silent> ,9 :set norelativenumber<CR>
noremap <silent> ,0 :nohl<CR>

" Reflow a paragragh
nnoremap Q gqap
" Reflow selected lines
vnoremap Q gq

map <c-f12> <esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

