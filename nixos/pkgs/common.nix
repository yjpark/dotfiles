{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xcape
    neovim
    git
    tig
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
    dzen2
    conky
    terminator
    wmctrl
    chromium
    albert
  ];
}
