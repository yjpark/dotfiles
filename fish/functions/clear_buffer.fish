function clear_buffer
    echo -e -n "\\0033c"
    # https://superuser.com/questions/59682/how-can-i-clear-the-scrollback-buffer-in-konsole-from-bash
    echo -e -n "\e[3J"
    if set -q TMUX
        tmux clear-history
    end
end
