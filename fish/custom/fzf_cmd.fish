function ,o
    fzf --select-1 --exit-0 +m -x > /tmp/fzf_fish.last
    set result (cat /tmp/fzf_fish.last)
    if test $result
        open (cat /tmp/fzf_fish.last)
    end
end

function ,e
    fzf --select-1 --exit-0 +m -x > /tmp/fzf_fish.last
    set result (cat /tmp/fzf_fish.last)
    if test $result
        nvim (cat /tmp/fzf_fish.last)
    end
end

function ,d
    fzf --select-1 --exit-0 +m -x > /tmp/fzf_fish.last
    set result (cat /tmp/fzf_fish.last)
    if test $result
        cd (dirname (cat /tmp/fzf_fish.last))
    end
end

function ,cd
    find . -path '*/\.*' -prune -o -type d -print 2> /dev/null | \
    fzf --select-1 --exit-0 +m -x > /tmp/fzf_fish.last
    set result (cat /tmp/fzf_fish.last)
    if test $result
        cd (cat /tmp/fzf_fish.last)
    end
end

function ,kill
    ps -ef | sed 1d | fzf --select-1 --exit-0 +m -x | awk '{print $2}' | xargs kill
end

function j
    cat $HOME/.z | sed "s/|.*//" | fzf --select-1 --exit-0 +m -x > /tmp/fzf_fish.last
    set result (cat /tmp/fzf_fish.last)
    if test $result
        cd (cat /tmp/fzf_fish.last)
    end
end
