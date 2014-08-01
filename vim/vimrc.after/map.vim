noremap ; :
noremap ' "
noremap <C-a> 0
noremap <C-e> $
imap <C-a> <Esc>0i
imap <C-e> <Esc>$a
set whichwrap+=<,>,h,l,[,]

"noremap <C-n> :Tbbn<CR>
"noremap <C-p> :Tbbp<CR>
noremap <C-n> :bn<CR>
noremap <C-p> :bp<CR>
noremap ,1 :!<CR> 
noremap <silent> ,3 :set guioptions+=bm<CR>:set wrap<CR>
noremap <silent> ,4 :set guioptions-=bm<CR>:set nowrap<CR>
noremap ,5 :set paste<CR>
noremap ,6 :set nopaste<CR>
noremap <silent> ,7 :w<CR>:!view-latex-pdf %<CR>
noremap <silent> ,8 :set relativenumber<CR>
noremap <silent> ,9 :set norelativenumber<CR>
noremap <silent> ,0 :nohl<CR>

noremap ,p :CtrlP<CR>
noremap ,. :Ack 
noremap ,, :CtrlPMRU<CR>
"noremap ,' <Leader><Leader>b
nnoremap ,t :CtrlPBufTag<cr>
nnoremap ,u :CtrlPFunky<Cr>

noremap ,s :Startify<CR>

noremap <C-g> :YcmCompleter GoToDeclaration<CR>
noremap ,g :YcmCompleter GoToImplementationElseDeclaration<CR>
noremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

noremap <silent> ,w :call yjpark:switchToFocusMode() <CR>
noremap <silent> ,m :call yjpark:switchToMaxMode() <CR>

noremap <silent> ,r :registers<CR>
"noremap <silent> ,l :TlistToggle<CR>
noremap <silent> ,b :NERDTreeToggle<CR>
noremap <silent> ,l :TagbarToggle<CR>
"noremap <silent> ,t :TagbarShowTag<CR>
noremap <silent> <leader>u :GundoToggle<CR>
noremap <silent> ,q :QuickfixsignsToggle<CR>

"Search the word under cursor, see :help cmdline-editing for more details
noremap <silent> ,f :Ack <C-r><C-w><CR>

map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

" Reflow a paragragh
nnoremap Q gqap
" Reflow selected lines
vnoremap Q gq

map <c-f12> <esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

