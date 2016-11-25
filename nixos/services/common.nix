{ config, pkgs, ... }:

{
  services.openssh.enable = true;
  networking.networkmanager.enable = true;
}
