function fish_title
  if [ "fish" != $_ ]
    set title (echo $_ | cut -b 1-24)
    tmux rename-window $title
    echo $title
  end
end

