{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    neovim
    git
    fish
    tmux
    binutils
  ];
}
