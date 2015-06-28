" http://rongmayisheng.com/post/windows%E4%B8%8Bgvim%E4%B8%AD%E6%96%87%E4%B9%B1%E7%A0%81%E8%A7%A3%E5%86%B3%E6%96%B9%E6%A1%88

set guifont=Sauce_Code_Powerline:h11:cANSI
" set encoding=utf-8
" set fileencodings=utf-8,chinese
" set termencoding=utf-8
" if has('win32') || has('win64')
"     set fileencoding=chinese
" else
"     set fileencoding=utf-8
" endif
"解决consle输出乱码
language messages zh_CN.utf-8

if has("gui_running")
    "解决菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
endif
