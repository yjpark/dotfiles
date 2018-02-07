{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libvirt
    virtmanager
    virt-viewer
    bridge-utils
    kvm
    qemu
    OVMF
  ];
}

