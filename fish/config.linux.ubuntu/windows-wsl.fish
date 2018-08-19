if grep -q Microsoft /proc/version
    # functions --erase fish_prompt
    set -x DOCKER_HOST tcp://127.0.0.1:2375
    set -x PATH ~/.dotfiles/bin/linux.ubuntu.wsl $PATH

    alias wsl 'set -x LS_COLORS "" ; set -x DISPLAY "127.0.0.1:0.0"'

    alias yarn 'yarn --cache-folder ~/.cache/yarn/v1'
    alias dotnet '/mnt/c/Program\ Files/dotnet/dotnet.exe'
    alias fake '~/win/.dotnet/tools/fake.exe'

    setup-ssh-agent
end


