{ config, pkgs, ... }:
{
  i18n = {
    #Have build problem
    consoleKeyMap = "dvorak";
    consoleFont = "latarcyrheb-sun32";
  };

  services.xserver.xkbVariant = "dvorak";
  services.xserver.exportConfiguration = true;
}
