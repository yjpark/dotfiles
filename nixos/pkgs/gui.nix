{ config, pkgs, ... }:

{
  allowUnfree = true;

  firefox = {
    enableGoogleTalkPlugin = true;
    enableAdobeFlash = true;
  };

  chromium = {
    enablePepperFlash = true; # Chromium removed support for Mozilla (NPAPI) plugins so Adobe Flash no longer works
    enablePepperPDF = true;
  };

  environment.systemPackages = with pkgs; [
    xsel
    xcape
    xclip
    xorg.xmodmap
    xbindkeys
    xdotool
    wmctrl
    albert
    # slack
    plasma-pa
    plasma-nm
    plasma-workspace
    plasma-desktop
    plasma-workspace-wallpapers
    kdeplasma-addons
    bluedevil
    bluez5
    gnome3.dconf
    gnome3.dconf-editor
    libinput
    kdeApplications.okular
    gwenview
    firefox
    chromium
    atom
    noto-fonts
    noto-fonts-cjk
  ];
}
