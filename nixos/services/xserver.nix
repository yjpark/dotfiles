{ config, pkgs, ... }:

{
    # Enable the X11 windowing system.
    services.xserver = {
      enable = true;
      layout = "us";

      # Gnome desktop
      # * Slightly more familiar than KDE for people who are used to working with Ubuntu
      # * Gnome3 works out of the box with xmonad
      desktopManager = {
        gnome3.enable = true;
        default = "gnome3";
      };

      # Enable XMonad Desktop Environment. (Optional)
      # windowManager = {
      #   xmonad.enable = true; 
      #   xmonad.enableContribAndExtras = true;
      # };
    };
}
