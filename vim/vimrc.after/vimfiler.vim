" http://www.zfanw.com/blog/vimfiler.html

" let g:vimfiler_as_default_explorer = 1

nnoremap <leader>b :VimFilerExplorer<CR>

let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_time_format = "%y-%m-%d %H:%H"

let g:vimfiler_ignore_pattern = "^\%(.git\|.DS_Store\|*.meta\)$"

autocmd FileType vimfiler
\ nmap <buffer> <Up> <Plug>(vimfiler_loop_cursor_up)

autocmd FileType vimfiler
\ nmap <buffer> <Down> <Plug>(vimfiler_loop_cursor_down)

autocmd FileType vimfiler
\ nmap <buffer> <u> <Plug>(vimfiler_switch_to_parent_directory)

autocmd FileType vimfiler
\ nunmap <buffer> <c-l>

