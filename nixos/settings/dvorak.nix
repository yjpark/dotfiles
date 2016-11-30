{ config, pkgs, ... }:
{
  i18n = {
    #Have build problem
    #consoleKeyMap = "dovrak";
  };

  services.xserver.xkbVariant = "dv";
  services.xserver.exportConfiguration = true;
}
