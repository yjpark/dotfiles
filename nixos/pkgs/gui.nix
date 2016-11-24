{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xorg.xmodmap
    xbindkeys
    xdotool
    wmctrl
    albert
  ];
}
