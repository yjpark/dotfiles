{ config, pkgs, ... }:
{
  programs.bash.enableCompletion = true;

  i18n = {
    consoleFont = "latarcyrheb-sun32";
    defaultLocale = "en_US.UTF-8";
  };

  services.xserver.xkbOptions = "ctrl:swapcaps";
}
