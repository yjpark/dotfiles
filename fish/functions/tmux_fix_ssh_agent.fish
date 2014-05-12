function tmux_fix_ssh_agent
    for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT
        set result (eval tmux show-environment | grep "^$key" > /dev/null)
        if test $result
            set value (tmux show-environment | grep "^$key" | sed -e "s/^[A-Z_]*=//")
            set -x $key $value
        end
    end
end
