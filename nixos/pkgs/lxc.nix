{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    lxc
    libvirt
  ];
}
