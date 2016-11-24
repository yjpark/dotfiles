{ config, pkgs, ... }:

{
  services.xserver.windowManager.i3 = {
    enable = false;
  };

  environment.systemPackages = with pkgs; [
    i3status
    dmenu
  ];
}
