if grep -q microsoft /proc/version
    # functions --erase fish_prompt
    set -x PATH ~/.dotfiles/bin/linux.ubuntu.wsl $PATH

    set -x LS_COLORS ""
    set -x DISPLAY "127.0.0.1:0.0"

    set -x DOCKER_HOST tcp://127.0.0.1:2375

    #alias yarn 'yarn --cache-folder ~/.cache/yarn/v1'
    #alias dotnet '/mnt/c/Program\ Files/dotnet/dotnet.exe'
    #alias paket='.paket/paket.exe'
    #alias fake '~/win/.dotnet/tools/fake.exe'

    alias term 'cd ~/temp ; nohup terminator &'

    set -x SPACEFISH_CHAR_SYMBOL ">"

    # https://www.turek.dev/post/fix-wsl-file-permissions/
    umask 0002
end

