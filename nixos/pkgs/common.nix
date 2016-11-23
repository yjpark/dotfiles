{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xcape
    neovim
    git
    tig
    gitAndTools.git-extras
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
    albert
  ];
}
