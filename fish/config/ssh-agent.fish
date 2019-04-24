if test -e ~/.ssh/id_dsa
    setup-ssh-agent
else if test -e ~/.ssh/id_rsa
    setup-ssh-agent
end
