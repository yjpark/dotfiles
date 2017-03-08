if &compatible
  set nocompatible
endif

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.config/.nvim/bundle/')

source ~/.config/nvim/init.bundle.vim

" Initialize plugin system
call plug#end()

source ~/.config/nvim/init.after.vim

" Need to install plugs manually
" :PlugInstall
