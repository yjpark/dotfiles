# https://github.com/NixOS/nixpkgs/issues/25264
#
# this module forces nix-{build,shell} to take 'config' and 'overlays'
# from <nixos-config> (default is /etc/nixos/configuration.nix) instead
# of $HOME/.config/nixpkgs/config.nix $HOME/.config/nixpkgs/overlays/

{
  config = {
    nixpkgs.overlays = [
      (self: super: rec {
        fakeClosure = self.writeText "fake-closure.nix" ''
          { system ? builtins.currentSystem }:

          let
            ccc = import <nixpkgs/nixos/lib/eval-config.nix> {
              inherit system;
              pkgs = import <nixpkgs> {
                inherit system;
                inherit (ccc.config.nixpkgs) config overlays;
              };
              modules = [ <nixos-config> /* or explicitly: /etc/nixos/configuration.nix */ ];
            };
          in
            ccc
        '';
        fakeConfig = self.writeText "fake-config.nix" ''
          (import ${fakeClosure} {}).config.nixpkgs.config
        '';
        fakeOverlays = self.writeTextDir "fake-overlay.nix" ''
          let
            ccc = import ${fakeClosure} {};
            lib = ccc.pkgs.lib;
          in
            lib.foldl' lib.composeExtensions (self: super: {}) ccc.config.nixpkgs.overlays
        '';
        nix = super.nixUnstable.overrideDerivation(old: {
          buildInputs = old.buildInputs ++ [ self.makeWrapper ];
          # let ".nix-shell-wrapped" work https://github.com/NixOS/nix/issues/1431
          postPatch = ''
            substituteInPlace src/nix-build/nix-build.cc --replace 'std::regex("nix-shell$")' 'std::regex("nix-shell")'
          '';
          postFixup = ''
            for f in $out/bin/{nix-build,nix-shell,nix-instantiate,nix}; do
              wrapProgram $f \
                --set NIXPKGS_CONFIG ${fakeConfig} \
                --prefix NIX_PATH : nixpkgs-overlays=${fakeOverlays}
            done
          '';
          doInstallCheck = false;
        });
      })
    ];
  };
}
