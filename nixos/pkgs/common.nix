{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
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
  ];
}
