{ config, pkgs, ... }:

{

  # Enable XMonad Desktop Environment. (Optional)
  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };

  # environment.systemPackages = with pkgs; [
  # can NOT install pkgs.xmonad-with-packages! otherwise there
  # might have multiple versions, and the one linked is not working
  #   xmonad-with-packages
  # ];
}
