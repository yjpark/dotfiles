" https://github.com/xqin/gvimfullscreen
if has('gui_running') && has('libcall')
    let g:MyVimLib = $VIMRUNTIME.'/gvimfullscreen.dll'
    function ToggleFullScreen()
        call libcallnr(g:MyVimLib, "ToggleFullScreen", 0)
    endfunction

    "Alt+Enter
    map <A-Enter> <Esc>:call ToggleFullScreen()<CR>

    let g:VimAlpha = 240
    function! SetAlpha(alpha)
        let g:VimAlpha = g:VimAlpha + a:alpha
        if g:VimAlpha < 180
            let g:VimAlpha = 180
        endif
        if g:VimAlpha > 255
            let g:VimAlpha = 255
        endif
        call libcall(g:MyVimLib, 'SetAlpha', g:VimAlpha)
    endfunction

    "Shift+Y
    nmap <s-y> <Esc>:call SetAlpha(3)<CR>
    "Shift+T
    nmap <s-t> <Esc>:call SetAlpha(-3)<CR>

    let g:VimTopMost = 0
    function! SwitchVimTopMostMode()
        if g:VimTopMost == 0
            let g:VimTopMost = 1
        else
            let g:VimTopMost = 0
        endif
        call libcall(g:MyVimLib, 'EnableTopMost', g:VimTopMost)
    endfunction

    "Shift+R
    nmap <s-r> <Esc>:call SwitchVimTopMostMode()<CR>
endif
