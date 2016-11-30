{ config, pkgs, ... }:
{
  users.extraUsers.yjpark = {
    isNormalUser = true;
    home = "/home/yjpark";
    description = "YJ Park";
    uid = 1000;
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "libvirt" "vboxusers" "docker" "lxd" "lxc" ];
    shell = "/run/current-system/sw/bin/bash";
    # For LXC/LXD
    subUidRanges = [ { startUid = 1000000; count = 65536; } ];
    subGidRanges = [ { startGid = 1000000; count = 65536; } ];
  };
}
