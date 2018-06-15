if grep -q Microsoft /proc/version
    # functions --erase fish_prompt
    set -x DOCKER_HOST tcp://127.0.0.1:2375
    set -x PATH ~/.dotfiles/bin/linux.ubuntu.wsl $PATH

    alias yarn 'yarn --cache-folder ~/.cache/yarn/v1'

    setup-ssh-agent
end


