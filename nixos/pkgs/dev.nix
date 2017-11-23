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
    mono50
    # monodevelop
    nodejs
    go
    patchelf
    vscode
    jdk
    maven
    nix-repl
    zeal
    dotnet-sdk
  ];
}
