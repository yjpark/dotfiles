{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libvirt
    lxc
    lxd
    virtmanager
    virt-viewer
    kvm
  ];
}

