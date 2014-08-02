nnoremap <C-n> :<C-u>call yjpark:next()<CR>
nnoremap <C-p> :<C-u>call yjpark:prev()<CR>

function! yjpark:next()
    if tabpagenr('$') == 1
        bnext
    else
        tabnext
    endif
endfunction

function! yjpark:prev()
    if tabpagenr('$') == 1
        bprevious
    else
        tabprevious
    endif
endfunction

nmap <C-t> :tab split<CR>
nnoremap ,w :tabclose<CR>

nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 10gt

inoremap <leader>1 <Esc>1gt
inoremap <leader>2 <Esc>2gt
inoremap <leader>3 <Esc>3gt
inoremap <leader>4 <Esc>4gt
inoremap <leader>5 <Esc>5gt
inoremap <leader>6 <Esc>6gt
inoremap <leader>7 <Esc>7gt
inoremap <leader>8 <Esc>8gt
inoremap <leader>9 <Esc>9gt
inoremap <leader>0 <Esc>10gt
