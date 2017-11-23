{ config, pkgs, ... }:
{
  # https://nixos.org/nixos/manual/options.html#opt-nix.nixPath
  # https://github.com/NixOS/nixpkgs/issues/25264
  # https://github.com/Mic92/dotfiles/blob/master/nixos/configuration.nix
  nix.nixPath = [
    "nixpkgs=/home/yjpark/projects/forks/nixpkgs"
    "nixos-config=/etc/nixos/configuration.nix"
    "/nix/var/nix/profiles/per-user/root/channels"
    # "nixpkgs-overlays=/home/joerg/git/nixos-configuration/overlays"
  ];
}
