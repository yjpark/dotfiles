export PATH=/usr/bin:/usr/local/bin:/opt/bin:$PATH

if [ -d "$HOME/.local/bin" ]; then
    export PATH="$PATH:$HOME/.local/bin"
fi

if [ -d "$HOME/snap/bin" ]; then
    export PATH="$PATH:$HOME/snap/bin"
fi

