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
    plasma-pa
    plasma-nm
    plasma-workspace
    plasma-desktop
    plasma-workspace-wallpapers
    kdeplasma-addons
    bluedevil
    bluez5
    gnome3.dconf
    gnome3.dconf-editor
    libinput
    kdeApplications.okular
    gwenview
  ];
}
