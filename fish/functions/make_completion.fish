# for let the alias to use same completion as the original command
# https://github.com/fish-shell/fish-shell/issues/393

function make_completion --argument alias command
    complete -c $alias -a "(
        set -l cmd (commandline -op);
        set -e cmd[1];
        complete -C\"$command \$cmd\";
    )"
end
