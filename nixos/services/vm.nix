{ config, pkgs, ... }:

{
  # https://nixos.org/wiki/Docker
  # gpasswd -a yjpark docker

  virtualisation.libvirtd.enable = true;
  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    lxc
  ];
}
