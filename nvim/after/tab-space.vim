set tabstop=4                                      "number of spaces per tab for display
set softtabstop=4                                  "number of spaces per tab in insert mode
set shiftwidth=4                                   "number of spaces when indenting

function! YJParkTab2()
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
endfunction

function! YJParkTab4()
    setlocal tabstop=4
    setlocal softtabstop=4
    setlocal shiftwidth=4
endfunction

nnoremap <Leader>t2 :<C-u>call YJParkTab2()<CR>
nnoremap <Leader>t4 :<C-u>call YJParkTab4()<CR>

autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype json setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype css setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

autocmd Filetype ex setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype exs setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

autocmd Filetype wxml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd Filetype wxss setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

autocmd Filetype nix setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

