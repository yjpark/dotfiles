" Copy/Paste under Mac OSX
nmap <C-X> ggvG$x:new<CR>pggvG$:!pbcopy<CR>:bdelete!<CR>
vmap <C-X> x:new<CR>pggvG$:!pbcopy<CR>:bdelete!<CR>
nmap <C-C> ggvG$y:new<CR>pggvG$:!pbcopy<CR>:bdelete!<CR>
vmap <C-C> y:new<CR>pggvG$:!pbcopy<CR>:bdelete!<CR>
nmap <C-V> :set paste<CR>:new<CR>:r !pbpaste<CR>ggv$xggvG$y:bdelete!<CR>P:set nopaste<CR>

