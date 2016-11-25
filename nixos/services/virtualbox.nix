{ config, pkgs, ... }:

{
  # https://nixos.org/wiki/Installing_VirtualBox_on_NixOS
  # Need to run this once
  #
  # sudo nix-prefetch-url file:///home/yjpark/Documents/Disk/Oracle_VM_VirtualBox_Extension_Pack-5.1.8-111374.vbox-extpack
  #
  virtualisation.virtualbox.host.enable = true;

  nixpkgs.config.virtualbox.enableExtensionPack = true;

  # Can NOT install here
  # environment.systemPackages = with pkgs; [
  #   virtualbox
  # ];
}
