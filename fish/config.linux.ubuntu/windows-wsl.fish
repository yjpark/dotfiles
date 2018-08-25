if grep -q Microsoft /proc/version
    # functions --erase fish_prompt
    set -x DOCKER_HOST tcp://127.0.0.1:2375
    set -x PATH ~/.dotfiles/bin/linux.ubuntu.wsl $PATH

    set -x LS_COLORS ""
    set -x DISPLAY "127.0.0.1:0.0"

    alias yarn 'yarn --cache-folder ~/.cache/yarn/v1'
    alias dotnet '/mnt/c/Program\ Files/dotnet/dotnet.exe'
    alias fake '~/win/.dotnet/tools/fake.exe'

    alias term 'cd ~/temp ; nohup terminator &'

    setup-ssh-agent
end


