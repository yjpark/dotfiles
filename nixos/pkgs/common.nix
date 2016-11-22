{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    git
    tig
    fish
    tmux
    binutils
    ag
    python3
  ];
}
