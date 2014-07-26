" Copy/Paste under Linux
vmap <C-X> x:new<CR>pggvG$:%w !xclip -selection clipboard -i<CR><ESC>:bdelete!<CR>
map <C-X> ggvG$x:new<CR>pggvG$:%w !xclip -selection clipboard -i<CR><ESC>:bdelete!<CR>
vmap <C-C> y:new<CR>pggvG$:%w !xclip -selection clipboard -i<CR><ESC>:bdelete!<CR>
map <C-C> ggvG$y:new<CR>pggvG$:%w !xclip -selection clipboard -i<CR><ESC>:bdelete!<CR>
map <C-V> :set paste<CR>:new<CR>:r !xclip -selection clipboard -o<CR>ggv$xggvG$y:bdelete!<CR>P:set nopaste<CR>

