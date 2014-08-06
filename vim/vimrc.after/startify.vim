NeoBundle 'mhinz/vim-startify' "{{{
    let g:startify_session_dir = s:get_cache_dir('sessions')
    let g:startify_change_to_dir = 0
    let g:startify_change_to_vcs_root = 1
    let g:startify_show_sessions = 1
    """nnoremap <F1> :Startify<cr>

    let g:startify_skiplist = [
        \ 'COMMIT_EDITMSG',
        \ $VIMRUNTIME . '/doc',
        \ '\.janus/.*/doc',
        \ 'vim/.*/doc',
        \ '\.DS_Store'
        \ ]

