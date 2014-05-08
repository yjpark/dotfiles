function fish_prompt
    ~/bin/powerline-shell_fish.py $status --shell bare ^/dev/null
end

function fish_right_prompt -d "Write out the right prompt"
    echo $vi_mode
end

# my stuffs
set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"

set -x HOST (hostname)
set -x PATH $PATH /usr/local/sbin ~/bin

. ~/.config/fish/aliases.fish
