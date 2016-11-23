{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    xcape
    neovim
    git
    tig
    fish
    tmux
    binutils
    ag
    fzf
    python3
    direnv
    tree
    dzen2
    conky
    terminator
    chromium
    albert
  ];
}
