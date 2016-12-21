" call dein#add('ElmCast/elm-vim')

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0

let g:elm_syntastic_show_warnings = 0

let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}
