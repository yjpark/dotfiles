# abbreviations
alias g "git"
make_completion g git
alias a "ag --smart-case"
make_completion a ag

# just aliases
alias l "ls -l"
alias cb clear_buffer

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

alias set-proxy-on "set -gx http_proxy 127.0.0.1:1102; set -gx ALL_PROXY http://127.0.0.1:1102"
alias set-proxy-off "set -ge http_proxy; set -ge ALL_PROXY"

alias wget "wget --no-check-certificate"

alias ssh "ssh -A"
alias scp "scp -C -p"

alias mosh "mosh --ssh='ssh -A'"

# some custom alias
alias e "vim"
alias vi "vim"
alias cp "cp -v"
alias mv "mv -v"

alias nload "nload -u K"

alias lu "du -s -h"
alias zhcon "zhcon --utf8 --drv=vga"

alias root "sudo chown root:root -R"

alias axel "axel -a"

alias htop "htop --sort-key PERCENT_CPU"

alias vimx "vim -u ~/.vimrcx -x"
