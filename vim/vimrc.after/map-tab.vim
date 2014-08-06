nnoremap <silent> <C-n> :<C-u>call yjpark:next()<CR>
nnoremap <silent> <C-p> :<C-u>call yjpark:prev()<CR>

nnoremap <C-t> :tab split<CR>
nnoremap ,w :tabclose<CR>

nnoremap <leader>1 :<C-u>call yjpark:goto(1)<CR>
nnoremap <leader>2 :<C-u>call yjpark:goto(2)<CR>
nnoremap <leader>3 :<C-u>call yjpark:goto(3)<CR>
nnoremap <leader>4 :<C-u>call yjpark:goto(4)<CR>
nnoremap <leader>5 :<C-u>call yjpark:goto(5)<CR>
nnoremap <leader>6 :<C-u>call yjpark:goto(6)<CR>
nnoremap <leader>7 :<C-u>call yjpark:goto(7)<CR>
nnoremap <leader>8 :<C-u>call yjpark:goto(8)<CR>
nnoremap <leader>9 :<C-u>call yjpark:goto(9)<CR>
nnoremap <leader>0 :<C-u>call yjpark:goto(10)<CR>

inoremap <leader>1 <Esc:<C-u>call yjpark:goto(1)<CR>
inoremap <leader>2 <Esc:<C-u>call yjpark:goto(2)<CR>
inoremap <leader>3 <Esc:<C-u>call yjpark:goto(3)<CR>
inoremap <leader>4 <Esc:<C-u>call yjpark:goto(4)<CR>
inoremap <leader>5 <Esc:<C-u>call yjpark:goto(5)<CR>
inoremap <leader>6 <Esc:<C-u>call yjpark:goto(6)<CR>
inoremap <leader>7 <Esc:<C-u>call yjpark:goto(7)<CR>
inoremap <leader>8 <Esc:<C-u>call yjpark:goto(8)<CR>
inoremap <leader>9 <Esc:<C-u>call yjpark:goto(9)<CR>
inoremap <leader>0 <Esc:<C-u>call yjpark:goto(10)<CR>

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

function! yjpark:goto(n)
    if tabpagenr('$') == 1
        let nr = airline#extensions#tabline#get_buffer_nr_by_visible_index(a:n)
        if (nr > 0)
            execute ':buffer ' . nr
        endif
    else
        execute ':tabnext' . a:n
    endif
endfunction

