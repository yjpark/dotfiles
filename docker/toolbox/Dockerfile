FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y git htop neovim tree silversearcher-ag fish
RUN apt-get install -y git inetutils-ping telnet net-tools apt-utils

ENTRYPOINT ["/usr/bin/fish"]
