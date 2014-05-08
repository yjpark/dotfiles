# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    xtitle() {
        echo -ne "\033]0;$1 $USER@$HOSTNAME:$PWD\007";
    }
    trap 'xtitle "[$(history 1 | cut -b 8-30)]"' DEBUG
    ;;
*)
    ;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
screen*)
    screentitle() {
        #echo -ne "\ek$1\e\\";
	printf "\033k$1\033\\"
    }
    trap 'screentitle "[$(history 1 | cut -b 8-30)]"' DEBUG
    ;;
*)
    ;;
esac
