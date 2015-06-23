# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Path to your custom folder (default path is $FISH/custom)
set fish_custom ~/.config/fish/custom

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Theme
Theme "agnoster"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
Plugin "brew"
Plugin "node"
Plugin "python"
Plugin "rvm"
Plugin "theme"
