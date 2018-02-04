{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wayland
    weston
    kwayland-integration
    sway
  ];
}
