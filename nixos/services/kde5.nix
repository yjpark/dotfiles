{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    synaptics.enable = true;

    desktopManager.default = "kde5";

    desktopManager.kde5 = {
      enable = true;
    };

    displayManager.kdm = {
      enable = true;
    };
  };
}
