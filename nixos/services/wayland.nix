{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wayland
    way-cooler
    kwayland-integration
    sway
  ];
}
