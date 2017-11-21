{ config, lib, pkgs, ... }:

{
  networking.nat = {
    enable = true;
    internalIPs = [ "10.0.1.0/24" ];
    internalInterfaces = [ "eno1" ];
    externalInterface = "wlp8s0";
    forwardPorts = [
      # { sourcePort = 53; destination = "127.0.0.1:53"; proto = "tcp"; }
      # { sourcePort = 53; destination = "127.0.0.1:53"; proto = "udp"; }
      # { sourcePort = 1101; destination = "127.0.0.1:1101"; proto = "tcp"; }
    ];
  };

  networking.interfaces.eno1 = {
    ipAddress = "10.0.1.1";
    prefixLength = 24;
  };

  networking.firewall = {
    enable = true;
    allowPing = true;
    trustedInterfaces = [ "lo" "eno1" "docker0" "tap0" "vboxnet0" "virbr0" ];
    allowedTCPPorts = [ 22 53 1100 1101 1102 1103 1104 8126 ];
    allowedUDPPorts = [ 53 ];
    extraCommands = ''
        iptables -t nat -A POSTROUTING -s 10.0.1.0/24 -o wlp8s0 -j MASQUERADE
    '';
    extraStopCommands = ''
      iptables -t nat -D POSTROUTING -s 10.0.1.0/24 -o wlp8s0 -j MASQUERADE
    '';
  };

  services.resolved = {
    enable = true;
    fallbackDns = [ "8.8.4.4" "114.114.114.114" ];
  };
}
