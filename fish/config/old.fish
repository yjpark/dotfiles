# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme agoster

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins git brew node python autojump

# Path to your custom folder (default path is $FISH/custom)
set fish_custom ~/.config/fish/custom

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# my stuffs
set -x LANG "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"

. ~/.config/fish/aliases.fish

. ~/_bin/settings/fish/custom/fishmarks/marks.fish

set -x HOST (hostname)

set -x PATH $PATH /usr/local/sbin
set -x PATH $PATH ~/bin ~/_bin/common
set -x PATH $PATH ~/_bin/substantial-games ~/_bin/pettyfun ~/pettyfun/dev/aws/bin
set -x PATH $PATH ~/pettyfun/libs/scripts ~/pettyfun/libs/tools


