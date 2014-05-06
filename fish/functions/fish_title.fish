function fish_title
  if [ "fish" != $_ ]
    tmux rename-window $_
    echo $_
  end
end

