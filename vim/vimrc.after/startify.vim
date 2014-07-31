let g:startify_enable_special = 0
let g:startify_session_dir = '~/.vim/session'

autocmd FileType startify setlocal buftype=

let g:startify_skiplist = [
       \ 'COMMIT_EDITMSG',
       \ $VIMRUNTIME . '/doc',
       \ '\.janus/.*/doc',
       \ 'vim/.*/doc',
       \ '\.DS_Store'
       \ ]

