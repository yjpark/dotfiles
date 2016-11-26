if [ -d "$HOME/.go" ]; then
    export GOPATH="$HOME/.go"
    export PATH="$PATH:$HOME/.go/bin"
fi
