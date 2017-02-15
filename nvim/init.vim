if &compatible
  set nocompatible
endif

set runtimepath+=~/.config/nvim/bundle/repos/github.com/Shougo/dein.vim/
call dein#begin('~/.config/nvim/bundle/')

call dein#add('Shougo/dein.vim')
source ~/.config/nvim/init.bundle.vim

call dein#end()
if dein#check_install()
    call dein#install()
endif
" call dein#install()

source ~/.config/nvim/init.after.vim
