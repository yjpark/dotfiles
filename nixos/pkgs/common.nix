{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xcape
    neovim
    git
    tig
    git-extras
    fish
    tmux
    binutils
    ag
    fzf
    htop
    iftop
    iotop
    dstat
    python3
    direnv
    tree
    dzen2
    conky
    wmctrl
    albert
    chromium
    firefox
  ];

  nixpkgs.config = {
    allowUnfree = true;

    firefox = {
      enableGoogleTalkPlugin = true;
      enableAdobeFlash = true;
    };

    chromium = {
      enablePepperFlash = true; # Chromium removed support for Mozilla (NPAPI) plugins so Adobe Flash no longer works
      enablePepperPDF = true;
    };
  };
}
