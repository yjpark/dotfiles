noremap ; :
noremap ' "
noremap <C-a> 0
noremap <C-e> $
noremap <C-n> :Tbbn<CR>
noremap <C-p> :Tbbp<CR>
noremap ,1 :!<CR> 
noremap <silent> ,3 :set guioptions-=b<CR>:set wrap<CR>
noremap <silent> ,4 :set guioptions+=b<CR>:set nowrap<CR>
noremap ,5 :set paste<CR>
noremap ,6 :set nopaste<CR>
noremap <silent> ,7 :w<CR>:!view-latex-pdf %<CR>
noremap <silent> ,8 :set relativenumber<CR>
noremap <silent> ,9 :set norelativenumber<CR>
noremap <silent> ,0 :nohl<CR>

noremap ,p :CtrlP<CR>
noremap ,. :Ack 
nmap ,, <Leader><Leader>w
nmap ,' <Leader><Leader>b

noremap <silent> ,w :call yjpark:switchToFocusMode() <CR>
noremap <silent> ,m :call yjpark:switchToMaxMode() <CR>

noremap <silent> ,r :registers<CR>
"noremap <silent> ,l :TlistToggle<CR>
noremap <silent> ,b :NERDTreeToggle<CR>
noremap <silent> ,l :TagbarToggle<CR>
noremap <silent> ,t :TagbarShowTag<CR>
noremap <silent> ,u :GundoToggle<CR>
noremap <silent> ,q :QuickfixsignsToggle<CR>

"Search the word under cursor, see :help cmdline-editing for more details
noremap <silent> ,f :Ack <C-r><C-w><CR>

map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

vmap <silent>sf        <Plug>SQLU_Formatter<CR>
nmap <silent>scl       <Plug>SQLU_CreateColumnList<CR>
nmap <silent>scd       <Plug>SQLU_GetColumnDef<CR>
nmap <silent>scdt      <Plug>SQLU_GetColumnDataType<CR>
nmap <silent>scp       <Plug>SQLU_CreateProcedure<CR> 

if hostname() == 'mbp' || hostname() == 'YJ-Parks-MacBook-Pro'
    " Cut/Copy/Paste under Mac OSX
    vmap <C-X> x:new<CR>pggvG<End>:!pbcopy<CR>:q!<CR>
    vmap <C-C> y:new<CR>pggvG<End>:!pbcopy<CR>:q!<CR>
    map <C-V> :set paste<CR>:new<CR>:r !pbpaste<CR>ggv<End>xggvG<End>y:q!<CR>p
    map! <C-V> <Esc>:set paste<CR>:new<CR>:r !pbpaste<CR>ggv<End>xggvG<End>y:q!<CR>pa
endif

"default leader is \
nmap <Leader>s :source $MYVIMRC
nmap <Leader>e :e $MYVIMRC

" Temporary key mappings ============================================
" change this.methodName -> \"methodName\", a trick when upgrade dojo
map ,a  <ESC>bbbdwxi"<ESC>ea"<ESC>
" Temporary key mappings end ========================================

" Reflow a paragragh
nnoremap Q gqap
" Reflow selected lines
vnoremap Q gq

" FuzzyFinder from
" http://rickey-nctu.blogspot.com/2009/02/vim-fuzzyfinder.html
map ff <esc>:FufFile<cr>
map fcd <esc>:FufDir<cr>
map fba <esc>:FufAddBookmark<cr>
map fbl <esc>:FufBookmark<cr>
map fu <esc>:FufBuffer<cr>
map <silent> <c-\> :FufTag! <c-r>=expand('<cword>')<cr><cr>
map <c-f12> <esc>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<cr>

