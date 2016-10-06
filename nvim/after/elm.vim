" call dein#add('ElmCast/elm-vim')
if !exists("g:ycm_semantic_triggers")
   let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['elm'] = ['.']

