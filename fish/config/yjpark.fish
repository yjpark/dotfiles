function fish_prompt
    ~/bin/powerline-shell.py $status --shell bare ^/dev/null
end

function fish_right_prompt -d "Write out the right prompt"
    echo $vi_mode
end

set -x GOPATH ~/.go
set -x PATH $PATH ~/.go/bin
