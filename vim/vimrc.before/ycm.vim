if v:version < '703' || !has('python')
    call add(g:pathogen_disabled, 'YouCompleteMe')
    " make YCM compatible with UltiSnips (using supertab)
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:SuperTabDefaultCompletionType = '<C-n>'
else
    "call janus#disable_plugin('supertab')
endif
