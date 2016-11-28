{ config, pkgs, ... }:

{
  virtualisation.lxd.enable = true;

  security.apparmor.enable = true;

  environment.systemPackages = with pkgs; [
    libapparmor
    apparmor-pam
    apparmor-profiles
    apparmor-parser
    apparmor-utils
    debootstrap
    dnsmasq
    bridge-utils
    gnupg1
    wget
  ];

  # Put this into the lxc config file
  # lxc.aa_allow_incomplete = 1;
  # lxc.init_cmd = "/nix/var/nix/profiles/system/init";
}
