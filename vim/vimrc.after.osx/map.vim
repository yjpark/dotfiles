" Copy/Paste under Mac OSX
vmap <C-X> x:new<CR>pggvG<End>:!pbcopy<CR>:q!<CR>
map <C-X> ggvG$x:new<CR>pggvG<End>:!pbcopy<CR>:q!<CR>
vmap <C-C> y:new<CR>pggvG<End>:!pbcopy<CR>:q!<CR>
map <C-C> ggvG$y:new<CR>pggvG<End>:!pbcopy<CR>:q!<CR>
map <C-V> :set paste<CR>:new<CR>:r !pbpaste<CR>ggv<End>xggvG<End>y:q!<CR>p
map! <C-V> <Esc>:set paste<CR>:new<CR>:r !pbpaste<CR>ggv<End>xggvG<End>y:q!<CR>pa

