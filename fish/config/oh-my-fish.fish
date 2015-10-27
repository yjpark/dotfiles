# Path to Oh My Fish install.
set -gx OMF_PATH $HOME/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG /Users/yjpark/.config/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# Path to your custom folder (default path is $FISH/custom)
set fish_custom ~/.config/fish/custom

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Theme
omf theme agnoster

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
omf plugin brew
omf plugin node
omf plugin python
omf plugin rvm
omf plugin theme
