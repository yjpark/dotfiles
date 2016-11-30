{ config, pkgs, ... }:

{
  services.openssh.enable = true;
  networking.networkmanager.enable = true;
  services.cron.enable = true;
}
