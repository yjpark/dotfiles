{ config, pkgs, ... }:
{
  programs.bash.enableCompletion = true;

  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  services.xserver.layout = "dvorak";
  services.xserver.xkbOptions = "ctrl:swapcaps";

  # Also Swap Control and Caps Lock
  # i18n.consoleKeyMap = ./dvorak.map;
}
