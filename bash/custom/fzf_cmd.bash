# https://github.com/junegunn/fzf/wiki/examples
#
# Opening files
#
# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
,e() {
    local file
    file=$(fzf --query="$@" --select-1 --exit-0 +m -x)
    [ -n "$file"  ] && ${EDITOR:-vim} "$file"
}

# Equivalent to above, but opens it with `open` command
,o() {
    local file
    file=$(fzf --query="$@" --select-1 --exit-0 +m -x)
    [ -n "$file"  ] && open "$file"
}


# Changing directory
# fd - cd to selected directory
,d() {
  local dir
  dir=$(find . -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf --query="$@" --select-1 --exit-0 +m -x) &&
  cd "$dir"
}

# fda - including hidden directories
,da() {
  local dir
  dir=$(find . -type d 2> /dev/null | fzf --query="$@" --select-1 --exit-0 +m -x) && cd "$dir"
}

# cdf - cd into the directory of the selected file
,df() {
   local file
   local dir
   file=$(fzf --query "$@" --select-1 --exit-0 +m -x) && dir=$(dirname "$file") && cd "$dir"
}

# fkill - kill process
,kill() {
  ps -ef | sed 1d | fzf --query "$@" --select-1 --exit-0 +m -x -x | awk '{print $2}' | xargs kill
}

# fbr - checkout git branch
,br() {
  local branches branch
  branches=$(git branch) &&
  branch=$(echo "$branches" | fzf --query "$@" --select-1 --exit-0 +s +m -x) &&
  git checkout $(echo "$branch" | sed "s/.* //")
}

# fco - checkout git commit
,co() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --query "$@" --select-1 --exit-0 +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# Integration with z, like normal z when used with arguments but displays an fzf prompt when used without.
j() {
  cd "$(_z -l 2>&1 | sed -n 's/^[ 0-9.,]*//p' | fzf --query "$@" --select-1 --exit-0 +m -x)"
}
