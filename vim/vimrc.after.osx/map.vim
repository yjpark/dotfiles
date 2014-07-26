" Copy/Paste under Mac OSX
vmap <C-X> x:new<CR>pggvG$:!pbcopy<CR>:bdelete!<CR>
map <C-X> ggvG$x:new<CR>pggvG$:!pbcopy<CR>:bdelete!<CR>
vmap <C-C> y:new<CR>pggvG$:!pbcopy<CR>:bdelete!<CR>
map <C-C> ggvG$y:new<CR>pggvG$:!pbcopy<CR>:bdelete!<CR>
map <C-V> :set paste<CR>:new<CR>:r !pbpaste<CR>ggv$xggvG$y:bdelete!<CR>P:set nopaste<CR>

