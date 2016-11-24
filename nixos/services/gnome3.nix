{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";

    desktopManager.default = "gnome3";

    desktopManager.gnome3 = {
      enable = true;
    };

    displayManager.gdm = {
      enable = true;
    };
  };
}
