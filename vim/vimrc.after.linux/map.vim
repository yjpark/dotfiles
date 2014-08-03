" Copy/Paste under Linux
" nmap <C-X> ggvG$x:new<CR>p:%w !xclip -selection clipboard -i<CR><ESC>:bdelete!<CR>
" vmap <C-X> x:new<CR>p:%w !xclip -selection clipboard -i<CR><ESC>:bdelete!<CR>
" nmap <C-C> ggvG$y:new<CR>p:%w !xclip -selection clipboard -i<CR><ESC>:bdelete!<CR>
" vmap <C-C> y:new<CR>p:%w !xclip -selection clipboard -i<CR><ESC>:bdelete!<CR>
" nmap <C-V> :set paste<CR>:new<CR>:r !xclip -selection clipboard -o<CR>ggv$xggvG$y:bdelete!<CR>p:set nopaste<CR>
