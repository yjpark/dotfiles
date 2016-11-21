{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.neovim
    pkgs.git
    pkgs.fish
  ];
}
