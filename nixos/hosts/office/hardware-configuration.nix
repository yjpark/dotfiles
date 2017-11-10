# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ehci_pci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.devices.crypted.device = "/dev/disk/by-id/nvme-eui.0025385961b04fb1-part2";
  boot.supportedFilesystems = [ "zfs" ];

  environment.systemPackages = with pkgs; [
    firmwareLinuxNonfree
  ];

  fileSystems."/" =
    { device = "rpool/root/nixos";
      fsType = "zfs";
    };

  fileSystems."/home" =
    { device = "rpool/home";
      fsType = "zfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/5117-3FC2";
      fsType = "vfat";
    };

  swapDevices = [ ];

  nix.maxJobs = lib.mkDefault 12;
  networking.hostId = "95728502";
  networking.networkmanager.enable = true;
  networking.enableIPv6 = false;

  i18n = {
    consoleKeyMap = "dvorak";
  };

  hardware.pulseaudio = {
    enable = true;
    support32Bit = true;
    package = pkgs.pulseaudioFull;
  };

  hardware.bluetooth.enable = true;

  # services.xserver.resolutions = [ { x = 1920; y = 1200; } ];
  services.xserver.videoDrivers = [ "nvidia" ];
}
