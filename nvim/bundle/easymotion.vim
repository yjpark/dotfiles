if exists('g:vscode')
    " Can not have both of them with same same, otherwise vim-plug will have
    " issues
    Plug 'yjpark/vscode-neovim-easymotion'
else
    Plug 'easymotion/vim-easymotion'
endif
