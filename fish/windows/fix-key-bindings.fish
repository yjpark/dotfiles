#!env fish

# https://github.com/fish-shell/fish-shell/issues/1160
# UPDATE: xxd -p [press RIGHT then ENTER] prints the codes. In my case they are
# 1b5b43 but
# bind \x1b\x5b\x43 forward-char does not work. Surprisingly
# bind \x5b\x43 forward-char does work, but again, there is a char there not being caught
# which messes everything up.


bind \cu backward-kill-line
bind \ch backward-delete-char
bind \cw backward-kill-path-component
bind \cf forward-char
bind \cb backward-char
bind \ca beginning-of-line
bind \ce end-of-line

bind \x5b\x41 up-or-search
bind \x5b\x42 down-or-search
bind \x5b\x43 forward-char
bind \x5b\x44 backward-char

alias a "ag --smart-case --search-files"

# https://github.com/fish-shell/fish-shell/issues/1335
set -x fish_color_error red --bold
set -x fish_color_escape cyan
set -x fish_color_history_current cyan
set -x fish_color_host -o cyan

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
