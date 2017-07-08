if grep -q Microsoft /proc/version
    functions --erase fish_prompt
    start-ssh-agent
end
