if grep -q Microsoft /proc/version
    # functions --erase fish_prompt
    set -x DOCKER_HOST tcp://127.0.0.1:2375
    setup-ssh-agent
end


