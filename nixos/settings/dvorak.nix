{ config, pkgs, ... }:
{
  i18n = {
    consoleKeyMap = "dvorak";
  };

  services.xserver.layout = "dvorak";
  services.xserver.xkbVariant = "dvorak";
  services.xserver.exportConfiguration = true;
}
