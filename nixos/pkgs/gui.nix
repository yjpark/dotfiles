{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xorg.xmodmap
    xbindkeys
    xdotool
    wmctrl
    albert
    kde5.plasma-pa
    kde5.plasma-nm
    kde5.plasma-workspace
    kde5.plasma-desktop
  ];
}
