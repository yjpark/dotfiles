alias gps 'ps -ef | grep -i'
alias gh 'history | grep -i'
alias gf 'find . \
             -path "*/.git/*" -prune -o \
             -path "*/.svn/*" -prune -o \
             -path "*/.hg/*" -prune -o \
             -path "*/.silp_backup/*" -prune -o \
             -path "*/.silp_test/*" -prune -o \
             -print | grep -i'
