{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xsel
    xclip
    xorg.xmodmap
    xbindkeys
    xdotool
    wmctrl
    albert
    slack
    kde5.plasma-pa
    kde5.plasma-nm
    kde5.plasma-workspace
    kde5.plasma-desktop
    kde5.plasma-workspace-wallpapers
    kde5.kdeplasma-addons
    kde5.bluedevil
    bluez5
    gnome3.dconf
    gnome3.dconf-editor
  ];
}
