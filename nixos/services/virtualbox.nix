{ config, pkgs, ... }:

{
  virtualisation.virtualbox.host.enable = true;

  # Can NOT install here
  # environment.systemPackages = with pkgs; [
  #   virtualbox
  # ];
}
