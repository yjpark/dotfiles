# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    color='--color=auto'
    alias grep='grep $color'
    alias ls='ls -F $color'
    #alias dir='ls $color --format=vertical'
    #alias vdir='ls $color --format=long'
fi

# some more ls aliases
alias nop='echo'
alias cb='echo -en \\0033c && tmux clear-history'
alias ll='ls -lh'
alias la='ls -A'
alias lal='ls -lhA'
alias ldl='ll -p | grep /'
alias less='less -R'
alias df='df -h'
alias iftop='sudo iftop -B -P'

alias use-proxy='. setup-terminal-proxy'

alias wget='wget --no-check-certificate'
alias scp='scp -C -p'

alias screen="screen -e'^Aa'"
alias screen-inside="screen -e'^Zz'"
alias screen-help='echo Use \"^a:escape ^Zz\" to change escape key for exist screen'

alias a="ag --smart-case"
alias g="git"

# some custom alias
alias e='vim'
alias vi='vim'
alias cp='cp -v'
alias mv='mv -v'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd......='cd ../../../../..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias sites='cd /usr/lib/python2.5/site-packages'
alias nload='nload -u K'

alias lu='du -s -h'
alias zhcon='zhcon --utf8 --drv=vga'

alias root='sudo chown root:root -R'

alias axel='axel -a'

alias cdif='cdif -color'
alias htop='htop --sort-key PERCENT_CPU'
