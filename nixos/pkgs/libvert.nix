{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libvirt
    virtmanager
    virt-viewer
    kvm
    qemu
    OVMF
  ];
}

