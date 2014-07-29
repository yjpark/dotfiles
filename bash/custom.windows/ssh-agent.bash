# http://blog.killtheradio.net/how-tos/ssh-agent-on-cygwin/

if [[ -e $HOME/.sshagent.conf ]]; then
. $HOME/.sshagent.conf
fi

start_ssh_agent() {
    ssh-agent >| $HOME/.sshagent.conf
    . $HOME/.sshagent.conf
    ssh-add ~/.ssh/id_rsa
}
