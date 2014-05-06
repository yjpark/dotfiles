#!/bin/bash

curl -vLo- https://bit.ly/janus-bootstrap > ~/.dotfiles/bootstrap/bootstrap-janus.sh
curl -vsL get.freshshell.com > ~/.dotfiles/bootstrap/bootstrap-fresh.sh

chmod 755 ~/.dotfiles/*.sh
