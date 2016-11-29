set title
set titlestring=%{GuiTabLabel()}\ \|\ %t%(\ %M%)\ :\ %l

function! GuiTabLabel()
     return substitute( expand( '%:p' ), '.\+\/\(.\+\)\/.\+', '\1', '' )
endfunction

