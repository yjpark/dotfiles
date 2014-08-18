NeoBundle 'tpope/vim-fugitive'
autocmd BufReadPost fugitive://* set bufhidden=delete

set diffopt=filler,vertical,iwhite,context:3

nnoremap <leader><leader>g :<C-u>G

nnoremap <leader><leader>gs :Gstatus<CR>
nnoremap <leader><leader>gd :Gdiff<CR>
nnoremap <leader><leader>gc :Gcommit<CR>
nnoremap <leader><leader>gb :Gblame<CR>
nnoremap <leader><leader>gl :Glog<CR>
nnoremap <leader><leader>gp :Git push<CR>
nnoremap <leader><leader>gw :Gwrite<CR>
nnoremap <leader><leader>gr :Gremove<CR>

