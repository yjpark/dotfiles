{ config, pkgs, ... }:
{
  # https://github.com/Mic92/dotfiles/blob/master/nixos/configuration.nix
  nix.nixPath = [
    "nixpkgs=/home/yjpark/projects/forks"
    "nixos-config=/etc/nixos/configuration.nix"
    # "nixpkgs-overlays=/home/joerg/git/nixos-configuration/overlays"
  ];
}
