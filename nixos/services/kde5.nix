{ config, pkgs, ... }:

{
  services.xserver = {
    enable = true;

    synaptics = {
      enable = false;
      palmDetect = true;
      twoFingerScroll = true;
    };

    libinput = {
      enable = true;
      naturalScrolling = true;
    };

    desktopManager.default = "plasma5";

    desktopManager.plasma5 = {
      enable = true;
    };

    displayManager.sddm = {
      enable = true;
      autoLogin = {
        #enable = true; #only enable on systems with LUKS
        user = "yjpark";
      };
      setupScript = "xrandr --dpi 48";
    };
  };
}
