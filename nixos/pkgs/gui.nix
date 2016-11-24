{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xorg.xmodmap
    xbindkeys
    wmctrl
    albert
  ];
}
