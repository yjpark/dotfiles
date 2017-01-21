{ config, pkgs, ... }:

{
  # https://nixos.org/wiki/Docker

  services.dnscrypt-proxy.enable = true;
}
