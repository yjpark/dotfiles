{ config, pkgs, ... }:
{
  i18n = {
    consoleKeyMap = "dvorak";
    consoleFont = "latarcyrheb-sun32";
  };

  services.xserver.xkbVariant = "dvorak";
  services.xserver.exportConfiguration = true;
}
