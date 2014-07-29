function clear_buffer
    echo -e -n "\\0033c"
    if set -q TMUX
        tmux clear-history
    end
end
