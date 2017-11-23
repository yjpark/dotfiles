let
  system = builtins.currentSystem;

  pkgs = import <nixpkgs> {
    inherit system;
    inherit (ccc.config.nixpkgs) config overlays;
  };

  ccc = import <nixpkgs/nixos/lib/eval-config.nix> {
    inherit system pkgs;
    modules = [ /etc/nixos/configuration.nix ];
  };
in
  ccc.config.nixpkgs.config
