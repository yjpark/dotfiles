" Send <C-o> in insert mode will run normal command
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
"Delete from cursor to end of word
inoremap <C-d> <C-o>dw


" http://vim.wikia.com/wiki/Prevent_escape_from_moving_the_cursor_one_character_to_the_left
inoremap <silent> <Esc> <C-O>:stopinsert<CR>

