export PATH="/usr/local/sbin:/usr/local/bin/:/usr/texbin:$PATH"
export LC_ALL="en_US.UTF-8"
export LANG="en_US.UTF-8"

alias vim='/Applications/MacVim.app/Contents/MacOS/Vim -n'
alias cdf='cd "$(/opt/local/bin/posd)"'

. /usr/local/etc/bash_completion 2>&1 > /dev/null &

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

#Android SDK
export PATH="~/Applications/adt-bundle-mac-x86_64-20131030/sdk/platform-tools:~/Applications/adt-bundle-mac-x86_64-20131030/sdk/tools:$PATH"

cd() {
   MAX=10
   LEN=${#DIRSTACK[@]}

   if [ $# -eq 0 ] || [ "$1" = "-" ]; then
      builtin cd "$@"
      pushd -n $OLDPWD > /dev/null
   else
      pushd "$@" > /dev/null || return 1
   fi

   if [ $LEN -ge $MAX ]; then
      popd -n -0 > /dev/null
   fi
}

alias iftop='sudo iftop -B -P -i en1'

# Marmalade
export PATH=/Applications/Marmalade.app/Contents/s3e/bin:$PATH
alias dzip=/Applications/Marmalade.app/Contents/tools/dzip/dzip

export NDK_ROOT=/Users/yjpark/App/android-ndk-r8d
