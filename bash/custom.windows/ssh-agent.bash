# http://blog.killtheradio.net/how-tos/ssh-agent-on-cygwin/

if [[ -e $HOME/.sshagent.conf ]]; then
. $HOME/.sshagent.conf
fi

if `ps -p ${SSH_AGENT_PID}>/dev/null`;then true;
else
ssh-agent >| $HOME/.sshagent.conf
. $HOME/.sshagent.conf
ssh-add ~/.ssh/id_dsa
fi
