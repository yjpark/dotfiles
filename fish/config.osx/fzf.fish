if test -d ~/.external/tools/fzf
    set -x PATH $PATH ~/.external/tools/fzf/bin
    alias f "fzf --ansi"
    alias ft "fzf-tmux --ansi"
end
