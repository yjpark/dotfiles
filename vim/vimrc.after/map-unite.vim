" http://www.codeography.com/2013/06/17/replacing-all-the-things-with-unite-vim.html
" http://bling.github.io/blog/2013/06/02/unite-dot-vim-the-plugin-you-didnt-know-you-need/
" -auto-preview

" Note: <C-u> here can remove range
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap ,p :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap ,' :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap ,, :<C-u>Unite -no-split -buffer-name=buffer  -quick-match buffer<cr>
nnoremap ,r :<C-u>Unite -no-split -buffer-name=register  register<cr>

"Not really using
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" For searching the word in the cursor in the current directory,
" noremap <silent> ,. :Unite grep:.:<CR>
" For searching the word in the cursor in the current buffer,
" noremap <silent> ,f :Unite grep:%::<C-r><C-w><CR>

" For searching the word in the cursor in all opened buffer
" noremap <silent> <Leader>sa :Unite grep:$buffers::<C-r><C-w><CR>

