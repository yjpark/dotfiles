{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    synaptics.enable = true;

    desktopManager.default = "plasma5";

    desktopManager.plasma5 = {
      enable = true;
    };

    displayManager.sddm = {
      enable = true;
    };
  };
}
