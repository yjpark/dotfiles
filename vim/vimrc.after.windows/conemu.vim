" http://stackoverflow.com/questions/23462034/vim-and-256-colors-in-conemu
set term=xterm
set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"
