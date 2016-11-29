set title
set titlestring=%{GetCurrentFolder()}\ \|\ %t%(\ %M%)\ :\ %l

function! GetCurrentFolder()
     return substitute( expand( '%:p' ), '.\+\/\(.\+\)\/.\+', '\1', '' )
endfunction

