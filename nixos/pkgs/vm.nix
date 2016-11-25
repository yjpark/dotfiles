{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libvirt
    lxc
    virtmanager
    virt-viewer
    kvm
  ];
}

