noremap ; :
noremap ' "
noremap <C-a> 0
noremap <C-e> $
imap <C-a> <Esc>0i
imap <C-e> <Esc>$a
set whichwrap+=<,>,h,l,[,]

noremap <silent> ,1 :VimShell<CR>
noremap <silent> ,2 :VimFiler<CR>

"noremap ,. :Ack 
"Search the word under cursor, see :help cmdline-editing for more details
"noremap <silent> ,f :Ack <C-r><C-w><CR>

"noremap ,p :CtrlP<CR>
"noremap ,, :CtrlPBuffer<CR>
"noremap ,' :CtrlPMRU<CR>
"noremap ,' <Leader><Leader>b

nnoremap ,t :CtrlPBufTag<cr>
nnoremap ,T :CtrlPBufTagAll<cr>
nnoremap ,u :CtrlPFunky<Cr>

noremap <C-g> :YcmCompleter GoToDeclaration<CR>
noremap ,g :YcmCompleter GoToImplementationElseDeclaration<CR>
noremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>

"noremap <silent> ,r :registers<CR>

noremap <silent> ,b :NERDTreeToggle<CR>
noremap <silent> ,l :TagbarToggle<CR>
"noremap <silent> ,t :TagbarShowTag<CR>
noremap <silent> <leader>u :GundoToggle<CR>
noremap <silent> ,q :QuickfixsignsToggle<CR>

nmap <leader>p :call AutoPairsToggle()<CR>

map <MiddleMouse> <Nop>
imap <MiddleMouse> <Nop>

