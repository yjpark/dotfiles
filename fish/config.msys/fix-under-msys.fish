#!env fish

# https://github.com/fish-shell/fish-shell/issues/1569
# https://github.com/fish-shell/fish-shell/issues/952
function x86
    echo '(x86)'
end
function X86
    echo '(X86)'
end

# https://github.com/fish-shell/fish-shell/issues/1887
# Need to setup the mintty config:
# - Terminal -> xterm-256color
# - Keys -> Backarrow sends ^H
