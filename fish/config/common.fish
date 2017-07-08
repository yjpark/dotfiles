function fish_prompt
    if grep -q Microsoft /proc/version
        echo (date "+%T") (~/bin/powerline-shell_fish.py $status --mode flat --shell bare ^/dev/null)
    else
        echo (date "+%T") (~/bin/powerline-shell_fish.py $status --shell bare ^/dev/null)
    end
end

function fish_right_prompt -d "Write out the right prompt"
    echo $vi_mode
end

# my stuffs
set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"

set -x HOST (hostname)
set -x PATH /usr/bin $PATH ~/bin

. ~/.config/fish/aliases.fish
