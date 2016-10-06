" call dein#add('leafgarland/typescript-vim')
" call dein#add('clausreinke/typescript-tools')

if !exists("g:ycm_semantic_triggers")
   let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']
