# function fish_prompt
#     echo (date "+%T") (~/bin/powerline-shell_fish.py $status --shell bare ^/dev/null)
# end

# function fish_right_prompt -d "Write out the right prompt"
#     echo $vi_mode
# end

# my stuffs
set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"

set -x HOST (hostname)
set -x PATH /usr/bin $PATH ~/bin

set -U fish_color_normal    normal
set -U fish_color_command   yellow
set -U fish_color_param     green

. ~/.config/fish/aliases.fish
