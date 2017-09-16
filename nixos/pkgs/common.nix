{ config, pkgs, ... }:

{
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    neovim
    nox
    vim
    git
    tig
    gitAndTools.git-extras
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
    lzma
    perl
    mosh
    wirelesstools
    inotify-tools
    zerotierone
    usbutils
    screen
    dropbox
    dropbox-cli
    pciutils
    acpi
    xcape
  ];
}
