{ config, pkgs, ... }:

{
  virtualisation.lxd.enable = true;

  environment.systemPackages = with pkgs; [
    debootstrap
    gnupg1
    wget
  ];

  # Put this into the lxc config file
  # lxc.aa_allow_incomplete = 1;
  # lxc.init_cmd = "/nix/var/nix/profiles/system/init";
}
