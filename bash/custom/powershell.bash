function _update_ps1()
{
    export PS1="$(date '+%T') [bash] $(~/bin/powerline-shell_fish.py $?)"
}

export PROMPT_COMMAND="_update_ps1"
