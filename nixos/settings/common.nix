{ config, pkgs, ... }:
{
  programs.bash.enableCompletion = true;

  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  services.xserver.layout = "dvorak";
  services.xserver.xkbOptions = "ctrl:swapcaps";
}
