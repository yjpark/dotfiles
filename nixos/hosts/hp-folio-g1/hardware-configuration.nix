# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, ... }:

{
  imports =
    [ <nixpkgs/nixos/modules/installer/scan/not-detected.nix>
    ];

  boot.kernelPackages = pkgs.linuxPackages_4_13;
  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
  # https://bbs.archlinux.org/viewtopic.php?id=226212
  # https://askubuntu.com/questions/525629/touchpad-is-not-recognized
  # https://unix.stackexchange.com/questions/28736/what-does-the-i8042-nomux-1-kernel-option-do-during-booting-of-ubuntu
  # boot.kernelParams = [ "i8042.reset" "i8042.nomux=0" "i8042.nopnp=1" "i8042.noloop=1"];
  # boot.kernelParams = [ "i2c-hid.dyndbg=+p" "i8042.reset" "i8042.nomux=0" "i8042.nopnp=1" "i8042.noloop=1" ];
  boot.kernelModules = [ "kvm-intel" "i2c-dev" "atmel" ]; #"intel-lpss" 
  boot.blacklistedKernelModules = [ ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.devices.crypted.device = "/dev/disk/by-id/nvme-eui.0025386cf100473f-part2";
  boot.supportedFilesystems = [ "zfs" ];

  boot.loader.grub = {
    devices = [ "/dev/nvme0n1" ];
    gfxmodeEfi = "1280x720";
    font = "/boot/grub.otf";
    fontSize = 32;
  };

  services.xserver.displayManager.sddm.autoLogin.enable = true;

  services.xserver.synaptics = {
    buttonsMap = [ 1 3 2 ];
    minSpeed = "10.0";
    maxSpeed = "40.0";
    accelFactor = "0.5";
  };

  fileSystems."/" =
    { device = "rpool/root/nixos";
      fsType = "zfs";
    };

  fileSystems."/home" =
    { device = "rpool/home";
      fsType = "zfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/3AFA-4B05";
      fsType = "vfat";
    };

  swapDevices = [ ];

  nix.maxJobs = lib.mkDefault 4;
  powerManagement.cpuFreqGovernor = "powersave";
  networking.hostId = "91278545";

  hardware.pulseaudio = {
   enable = true;
   support32Bit = true; # This might be needed for Steam games
   package = pkgs.pulseaudioFull;
  };

  hardware.bluetooth.enable = true;
}
