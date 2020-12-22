FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y git htop neovim tree silversearcher-ag fish
RUN apt-get install -y inetutils-ping telnet net-tools curl axel netcat

# RUN git clone https://github.com/yjpark/dotfiles.git ~/.dotfiles
# RUN ~/.dotfiles/freshrc

ENTRYPOINT ["/usr/bin/fish"]
