if grep -q Microsoft /proc/version
    functions --erase fish_prompt
    fundle plugin "oh-my-fish/theme-gitstatus"
    start-ssh-agent
end
