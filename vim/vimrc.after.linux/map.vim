" Copy/Paste under Linux
vmap <C-X> x:new<CR>pggvG<End><Esc>:%w !xclip -selection clipboard -i<CR><ESC>:q!<CR>
map <C-X> ggvG$x:new<CR>pggvG<End><Esc>:%w !xclip -selection clipboard -i<CR><ESC>:q!<CR>
vmap <C-C> y:new<CR>pggvG<End><Esc>:%w !xclip -selection clipboard -i<CR><ESC>:q!<CR>
map <C-C> ggvG$y:new<CR>pggvG<End><Esc>:%w !xclip -selection clipboard -i<CR><ESC>:q!<CR>
map <C-V> :set paste<CR>:new<CR>:r !xclip -selection clipboard -o<CR>ggv<End>xggvG<End>y:q!<CR>p
map! <C-V> <Esc>:set paste<CR>:new<CR>:r !xclip -selection clipboard -o<CR>ggv<End>xggvG<End>y:q!<CR>pa

