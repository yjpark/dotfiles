if test -d ~/.termux
    setenv SSH_ENV $HOME/.ssh/environment
    if [ -f $SSH_ENV ]
        source $SSH_ENV > /dev/null
    else
        ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
    end
else if test -e ~/.ssh/id_ecdsa
    setup-ssh-agent
else if test -e ~/.ssh/id_dsa
    setup-ssh-agent
else if test -e ~/.ssh/id_rsa
    setup-ssh-agent
end
