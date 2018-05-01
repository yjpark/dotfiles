" Show colors for log files with color codes, the delay is needed here to make
" it works.
" http://vim.wikia.com/wiki/Forcing_Syntax_Coloring_for_files_with_odd_extensions
" https://vi.stackexchange.com/questions/15068/delay-before-running-vim-command
autocmd BufNewFile,BufRead *.ansi.log call timer_start(100, { tid -> execute('AnsiEsc')})
