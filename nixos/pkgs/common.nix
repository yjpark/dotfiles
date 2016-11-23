{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xcape
    neovim
    git
    tig
    git-extras
    fish
    tmux
    binutils
    ag
    fzf
    htop
    iftop
    iotop
    dstat
    python3
    direnv
    tree
    dzen2
    conky
    wmctrl
    chromium
    albert
  ];
}
