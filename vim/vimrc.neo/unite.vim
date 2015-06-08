let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_source_history_yank_enable=1
let g:unite_source_rec_max_cache_files=5000
let g:unite_prompt='» '

if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --line-numbers --nogroup -S'
    let g:unite_source_grep_recursive_opt=''
elseif executable('ack')
    let g:unite_source_grep_command='ack'
    let g:unite_source_grep_default_opts='--no-heading --no-color'
    let g:unite_source_grep_recursive_opt=''
endif

" Ignore certain files and directories while searching
call unite#custom#source('file,file_rec,file_rec/async,grep',
            \ 'ignore_pattern', join([
      \ '\.git/',
      \ '\.bundle/',
      \ '\.rubygems/',
      \ 'vendor/',
      \ 'node_modules/',
      \ '\.meta$',
      \ '\.ctrlp$',
      \ '\.swp$',
      \ '\.swo$',
      \ '\.DS_Store$',
      \ '\.silp_backup/',
      \ '\.silp_test/',
      \ ], '\|'))

let g:unite_quick_match_table = {
      \ '1' : 0, '2' : 1, '3' : 2, '4' : 3, '5' : 4, '6' : 5, '7' : 6, '8' : 7, '9' : 8, '0' : 9,
      \ 'a' : 10, 's' : 11, 'd' : 12, 'f' : 13, 'g' : 14, 'h' : 15, 'j' : 16, 'k' : 17, 'l' : 18, ';' : 19,
      \ 'q' : 20, 'w' : 21, 'e' : 22, 'r' : 23, 't' : 24, 'y' : 25, 'u' : 26, 'i' : 27, 'o' : 28, 'p' : 29
      \ }

call unite#custom#source(
    \ 'file_rec/async,file_rec,file_mru,buffer,quickfix', 'matchers',
    \ ['converter_tail', 'matcher_default'])
call unite#custom#source(
    \ 'file_rec/async,file_rec,file_mru,buffer', 'converters',
    \ ['converter_file_directory'])
call unite#custom#source('file,file/new',
    \ 'matchersers', 'matcher_fuzzy')

" call unite#filters#sorter_default#use(['sorter_rank'])
" call unite#filters#matcher_default#use(['matcher_fuzzy'])

" http://www.codeography.com/2013/06/17/replacing-all-the-things-with-unite-vim.html
" http://bling.github.io/blog/2013/06/02/unite-dot-vim-the-plugin-you-didnt-know-you-need/
" -auto-preview

" Note: <C-u> here can remove range
"nnoremap ,p :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>

nnoremap ,<Space> :<C-u>Unite -no-quit -buffer-name=unite 

nnoremap ,p :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async<cr>
nnoremap ,' :<C-u>Unite -no-split -buffer-name=mru -start-insert file_mru<cr>
nnoremap ,, :<C-u>Unite -no-split -buffer-name=buffer -start-insert buffer<cr>
nnoremap ,r :<C-u>Unite -no-split -buffer-name=register -quick-match -default-action=yank -auto-quit register<cr>
nnoremap ,t :<C-u>Unite -no-split -buffer-name=tag -start-insert tag<cr>

"Not really using
nnoremap ,o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap ,y :<C-u>Unite -no-split -buffer-name=yank -quick-match history/yank<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Not showing the trailing space as red if has vim-trailing-color installed
  autocmd InsertLeave <buffer> match ExtraWhitespace //
  autocmd InsertEnter <buffer> match ExtraWhitespace //
  autocmd BufWinEnter <buffer> match ExtraWhitespace //
  autocmd WinEnter <buffer> setlocal nocursorcolumn
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <buffer> <C-c>   <Plug>(unite_exit)
  nmap <buffer> <C-c>   <Plug>(unite_exit)
  nmap <buffer> <BS>    <Plug>(unite_exit)
endfunction


" Search with ag
noremap <silent> ,. :<C-u>Unite -no-quit -buffer-name=grep grep:.:<CR>
" For searching the word in the cursor in the current buffer,
noremap <silent> ,f :<C-u>Unite -no-quit -buffer-name=grep grep:.:<CR><C-r><C-w><CR>

" showing quickfix with error only (mainly for the omnisharp build result for now)
noremap <silent> ,x :<C-u>Unite -no-quit -buffer-name=quickfix -start-insert quickfix<CR>error

" For searching the word in the cursor in all opened buffer
" noremap <silent> <Leader>sa :Unite grep:$buffers::<C-r><C-w><CR>

