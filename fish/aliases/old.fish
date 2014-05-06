# abbreviations
alias g "git"
make_completion g git
alias a "ag --smart-case"
make_completion a ag

# just aliases
alias cb "echo -en \\\\0033c; and tmux clear-history"
alias l "ls -l"

alias tmux "tmux -u"
alias ll "ls -lh"
alias la "ls -A"
alias lal "ls -lhA"
alias ldl "ll -p | grep /"
alias less "less -R"
alias df "df -h"
alias mbp "sudo hostname mbp; . ~/bin/mbp/yjpark.fish"
alias air "sudo hostname air; . ~/bin/air/yjpark.fish"
alias win ". ~/bin/win/fish.yjpark"
alias iftop "sudo iftop -B -P"

alias use-proxy ". setup-terminal-proxy"

alias wget "wget --no-check-certificate"


alias scp "scp -C -p"

# some custom alias
alias e "vim"
alias vi "vim"
alias cp "cp -v"
alias mv "mv -v"
alias cd.. "cd .."
alias cd... "cd ../.."
alias cd.... "cd ../../.."
alias cd..... "cd ../../../.."
alias cd...... "cd ../../../../.."
alias .. "cd .."
alias ... "cd ../.."
alias .... "cd ../../.."
alias ..... "cd ../../../.."
alias ...... "cd ../../../../.."

alias nload "nload -u K"

alias lu "du -s -h"
alias zhcon "zhcon --utf8 --drv=vga"

alias root "sudo chown root:root -R"

alias axel "axel -a"

alias cdif "cdif -color"
alias htop "htop --sort-key PERCENT_CPU"

alias vimx "vim -u ~/.vimrcx -x"


