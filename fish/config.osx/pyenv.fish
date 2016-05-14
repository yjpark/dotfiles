set -x PATH $PATH ~/.pyenv/bin
status --is-interactive; and . (pyenv init - | psub) ; and pyenv shell 3.5.1
