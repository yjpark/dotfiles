" Quickly switch to insert mode
nnoremap <cr> i
nnoremap <bs> i<bs>

" Send <C-o> in insert mode will run normal command
" Home/End under OSX
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
" Cursor Move
inoremap <C-j> <C-o>j
inoremap <C-k> <C-o>k
" Easymotion in insert mode,
imap <C-w> <C-o><leader><leader>b
imap <C-v> <C-o><leader><leader>w
"Delete from cursor to end of word
inoremap <C-d> <C-o>dw

" http://vim.wikia.com/wiki/Prevent_escape_from_moving_the_cursor_one_character_to_the_left
let CursorColumnI = 0 "the cursor column position in INSERT
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif"

set timeoutlen=2000
au InsertLeave * set timeoutlen=2000
au InsertEnter * set timeoutlen=10
