{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";

    desktopManager.default = "kde5";

    desktopManager.kde5 = {
      enable = true;
    };

    displayManager.kdm = {
      enable = true;
    };
  };
}
