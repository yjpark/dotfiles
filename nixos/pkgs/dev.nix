{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ruby
    python35Packages.ipython
    python35Packages.bootstrapped-pip
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
    nodejs-6_x
    go
    patchelf
  ];
}
