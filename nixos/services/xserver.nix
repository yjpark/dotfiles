{ config, pkgs, ... }:

{
  imports =
    [
      ../pkgs/i3.nix
    ];
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us";

    desktopManager.default = "gnome3";

    desktopManager.gnome3 = {
      enable = true;
    };

    # desktopManager.kde5 = {
    #   enable = true;
    # };

    # windowManager.default = "i3";

    # Enable XMonad Desktop Environment. (Optional)
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };

    windowManager.i3 = {
      enable = true;
    };
  };
}
