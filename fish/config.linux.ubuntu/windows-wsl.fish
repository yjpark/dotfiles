if grep -q microsoft /proc/version
    # functions --erase fish_prompt
    set -x PATH ~/.dotfiles/bin/linux.ubuntu.wsl $PATH

    set -x LS_COLORS ""
    set -x DISPLAY "127.0.0.1:0.0"

    #set -x DOCKER_HOST tcp://127.0.0.1:2375
    # https://www.turek.dev/post/fix-wsl-file-permissions/
    umask 0002

    alias set-proxy-trojan "set -gx https_proxy 172.22.1.9:1102; set -gx http_proxy 172.22.1.9:1102; set -gx ALL_PROXY http://172.22.1.9:1102"
end

