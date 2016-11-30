{ config, pkgs, ... }:
{
  programs.bash.enableCompletion = true;

  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  services.xserver.layout = "us";
}
