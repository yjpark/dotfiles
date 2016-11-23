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

    desktopManager.kde5 = {
      enable = false;
    };

    # windowManager.default = "i3";

    # Enable XMonad Desktop Environment. (Optional)
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
    };

    windowManager.i3 = {
      enable = false;
    };
  };

  #can NOT install pkgs.xmonad-with-packages! otherwise there
  #might have multiple versions, and the one linked is not working
  #environment.systemPackages = with pkgs; [
  #  xmonad-with-packages
  #];
}
