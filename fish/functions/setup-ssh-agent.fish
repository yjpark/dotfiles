setenv SSH_ENV $HOME/.ssh/environment

function setup-ssh-agent
    if [ -f $SSH_ENV ]
        source $SSH_ENV > /dev/null
    end
    if [ -n "$SSH_AGENT_PID" ]
        ps -ef | grep $SSH_AGENT_PID | grep ssh-agent > /dev/null
        if [ $status -eq 0 ]
            check_ssh_identity
        else
            reset_ssh_agent
        end
    else
        ps -ef | grep "ssh-agent -c" | grep -v grep | grep "ssh-agent -c" > /dev/null
        if [ $status -eq 0 ]
            check_ssh_identity
        else
            echo "Initializing new ssh-agent ..."
            ssh-agent -c | sed 's/^echo/#echo/' > $SSH_ENV
            echo "succeeded"
            chmod 600 $SSH_ENV 
            source $SSH_ENV > /dev/null
            ssh-add
        end
    end
end

function reset_ssh_agent
    echo "Reset ssh-agent"
    pkill -9 ssh-agent
    rm $SSH_ENV
    set -ex SSH_AGENT_PID
    setup-ssh-agent
end


function check_ssh_identity
    #echo "Checking ssh identity: $SSH_AGENT_PID $SSH_ENV"
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $status -eq 0 ]
        ssh-add
    else
        ssh-add -l 2>&1 | grep "Connection refused" > /dev/null
        if [ $status -eq 0 ]
            reset_ssh_agent
        end
    end
end
