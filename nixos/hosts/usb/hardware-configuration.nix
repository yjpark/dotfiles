# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "ahci" "usb_storage" "sd_mod" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/de1a29a7-dc93-451b-8a9a-bb7b62af2729";
      fsType = "ext4";
      options = [ "noatime" "nodiratime" "discard"];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/90C1-070D";
      fsType = "vfat";
    };

  swapDevices = [ ];

  nix.maxJobs = lib.mkDefault 4;

  # virtualisation.virtualbox.guest.enable = true;

  services.xserver.videoDrivers = [
    "nvidia"
    # "ati_unfree"
  ];

  hardware.pulseaudio = {
   enable = true;
   support32Bit = true; # This might be needed for Steam games
   package = pkgs.pulseaudioFull;
 };

  hardware.bluetooth.enable = true;
}