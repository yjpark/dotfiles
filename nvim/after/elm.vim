" call dein#add('ElmCast/elm-vim')
" if !exists("g:ycm_semantic_triggers")
"    let g:ycm_semantic_triggers = {}
" endif
" let g:ycm_semantic_triggers['elm'] = ['.']

" autocomplete only on attributes; doesn't seem to complete local vars
" let g:deoplete#omni_patterns.elm = '\.'

" show types in autocomplete menu
let g:elm_detailed_complete = 1

" (Assuming settings like the following)
" let g:deoplete#omni#functions = {}
" let g:deoplete#omni#sources = {}
" let g:deoplete#omni#sources._ = ['file', 'neosnippet']
" let g:deoplete#omni#input_patterns = {}

let g:deoplete#omni#functions.elm = ['elm#Complete']
let g:deoplete#omni#input_patterns.elm = '[^ \t]+'
let g:deoplete#sources.elm = ['omni'] + g:deoplete#sources._
