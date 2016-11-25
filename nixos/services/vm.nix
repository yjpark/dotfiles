{ config, pkgs, ... }:

{
  # https://nixos.org/wiki/Docker
  # gpasswd -a yjpark docker

  virtualisation.libvirtd.enable = true;
  virtualisation.docker.enable = true;
  virtualisation.lxd.enable = true;

  environment.systemPackages = with pkgs; [
    lxc
    gnupg1
    wget
  ];
}
