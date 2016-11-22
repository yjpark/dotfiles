{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    ruby
  ];
}
