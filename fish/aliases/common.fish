# abbreviations
alias d "docker"
make_completion d docker
alias g "git"
make_completion g git

if command -s rg > /dev/null
    alias a "rg --smart-case --line-number"
    make_completion a rg
else
    alias a "ag --smart-case --line-number --ignore-dir bin --ignore-dir obj"
    make_completion a ag
end


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

alias set-proxy-off "set -ge https_proxy; set -ge http_proxy; set -ge ALL_PROXY"
alias set-proxy-ss "set -gx https_proxy 127.0.0.1:1102; set -gx http_proxy 127.0.0.1:1102; set -gx ALL_PROXY http://127.0.0.1:1102"
alias set-proxy-v2ray "set -gx https_proxy 127.0.0.1:1104; set -gx http_proxy 127.0.0.1:1104; set -gx ALL_PROXY http://127.0.0.1:1104"
alias set-proxy-cow "set -gx https_proxy 127.0.0.1:1100; set -gx http_proxy 127.0.0.1:1100; set -gx ALL_PROXY http://127.0.0.1:1100"
alias set-proxy-fiddler "set -gx https_proxy 127.0.0.1:8888; set -gx http_proxy 127.0.0.1:8888; set -gx ALL_PROXY http://127.0.0.1:8888"

alias wget "wget --no-check-certificate"

alias ssh "ssh -A"
alias scp "scp -C -p"

alias mosh "mosh --ssh='ssh -A'"

# some custom alias

if command -s nvim > /dev/null
    alias e "nvim"
else
    alias e "vim"
end

alias cp "cp -v"
alias mv "mv -v"

alias nload "nload -u K"

alias lu "du -s -h"
alias zhcon "zhcon --utf8 --drv=vga"

alias root "sudo chown root:root -R"

alias axel "axel -a"

alias htop "htop --sort-key PERCENT_CPU"

alias vimx "vim -u ~/.vimrcx -x"
alias update-completions "fish_update_completions"

alias gwp git-commit-wip-push

