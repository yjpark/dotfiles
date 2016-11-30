{ config, pkgs, ... }:
{
  i18n = {
    consoleKeyMap = "dovrak";
  };

  services.xserver.xkbVariant = "dv";
  services.xserver.exportConfiguration = true;
}
