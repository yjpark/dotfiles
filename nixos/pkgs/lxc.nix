{ config, pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.lxc
    pkgs.libvirt
  ];
}
