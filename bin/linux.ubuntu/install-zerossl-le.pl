#!/usr/bin/env bash
# https://zerossl.com/installation.html

sudo apt-get install make gcc libssl-dev liblocal-lib-perl cpanminus

sudo cpanm Test::More Crypt::LE
