function _update_ps1()
{
    export PS1="$(~/bin/powerline-shell.py $?)"
}

export PROMPT_COMMAND="_update_ps1"
