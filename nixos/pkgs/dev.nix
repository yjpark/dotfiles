{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    ruby
    python35Packages.ipython
    kompare
  ];
}
