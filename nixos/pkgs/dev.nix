{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nodejs
    ruby
    python35Packages.ipython
    kde5.kompare
    zeal
    cmake
    gnumake
    gcc
    elixir
    erlang
    rebar3
    mono
    monodevelop
  ];
}
