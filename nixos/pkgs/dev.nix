{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ruby
    python35Packages.ipython
    python35Packages.bootstrapped-pip
    #kompare
    zeal
    cmake
    gnumake
    gcc
    autoconf
    automake
    libtool
    elixir
    erlang
    rebar3
    mono
    monodevelop
    nodejs-6_x
    go
    patchelf
    vscode
    jdk
    maven
  ];
}
