if grep -q microsoft /proc/version
    # functions --erase fish_prompt
    set -x PATH ~/.dotfiles/bin/linux.ubuntu.wsl $PATH

    set -x LS_COLORS ""
    set -x DISPLAY "127.0.0.1:0.0"

    #set -x DOCKER_HOST tcp://127.0.0.1:2375
    # https://www.turek.dev/post/fix-wsl-file-permissions/
    umask 0002

    alias set-proxy-trojan "set -gx https_proxy windows-host:1102; set -gx http_proxy windows-host:1102; set -gx ALL_PROXY http://windows-host:1102"
    alias set-proxy-panda "set -gx https_proxy windows-host:1104; set -gx http_proxy windows-host:1104; set -gx ALL_PROXY http://windows-host:1104"
end

