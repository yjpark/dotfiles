#!env fish

function fix-tmux
    # set-option -g prefix C-a
    # unbind-key C-b

    tmux set -g default-terminal "screen-256color"

    # use vim motion keys while in copy mode
    tmux setw -g mode-keys vi
    tmux setw -g mode-mouse on
    tmux set-window-option -g mode-mouse on
    tmux setw -g monitor-activity on

    tmux set -g history-limit 10240

    tmux set-option -g mouse-select-pane on
    tmux set-option -g status-keys vi
    tmux set-option -g bell-action any
    tmux set-option -g visual-bell on

    tmux unbind % # Remove default binding since we’re replacing
    tmux bind | split-window -h
    tmux bind - split-window -v

    # 0 is too far from ` ;)
    tmux set -g base-index 1

    # Set window notifications
    tmux setw -g monitor-activity on
    tmux set -g visual-activity on


    #http://unix.stackexchange.com/questions/23138/esc-key-causes-a-small-delay-in-terminal-due-to-its-alt-behavior
    tmux set -s escape-time 0

    # pane movement
    # http://unix.stackexchange.com/questions/14300/tmux-move-window-to-pane
    tmux bind-key j command-prompt -p "join pane from:"  "join-pane -s '%%'"
    tmux bind-key s command-prompt -p "send pane to:"  "join-pane -t '%%'"
    # Set status bar
    tmux set -g status-interval 7
    tmux set -g status-bg black
    tmux set -g status-fg white
    tmux set -g status-left '#[fg=green]#H'

    # Highlight active window
    tmux set-window-option -g window-status-current-fg red

    tmux set -g status-right '#(tmux-mem --format "[#[fg=:color]:spark#[default]] #[fg=:color]:percent#[default]") #(tmux-cpu --format ":load [#[fg=:color]:spark#[default]] #[fg=:color]:percent#[default]") %H:%M'
    # http://stackoverflow.com/questions/11832199/tmux-set-g-mouse-mode-on-doesnt-work
    tmux setw -g mouse on
    # https://github.com/tmux/tmux/issues/145

    tmux bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'select-pane -t=; copy-mode -e; send-keys -M'"
    tmux bind -n WheelDownPane select-pane -t= \; send-keys -M
end

