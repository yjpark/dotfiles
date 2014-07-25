function fish_title
  if [ "fish" != $_ ]
    set title (echo $_ | cut -b 1-24)
    if set -q TMUX
      tmux rename-window $title
    end
    echo $title
  end
end

