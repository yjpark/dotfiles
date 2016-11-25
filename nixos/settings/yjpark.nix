{ config, pkgs, ... }:
{
  users.extraUsers.yjpark = {
    isNormalUser = true;
    home = "/home/yjpark";
    description = "YJ Park";
    uid = 1000;
    extraGroups = [ "wheel" "networkmanager" "libvirtd"];
    shell = "/run/current-system/sw/bin/bash";
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDeu37LVryVQqQHc+7WIHWHD0rdkbFNvuiZcWEjCD5odkMIft7uTxdwuy9gj/9qy62Qa+4MuBOf3Z5Z4VEmU+2ptgiPO8mHw1b1Du4BJMdOQbXSIKdhfxDelZ3+GUV8w/9prnW196NIJDblhaOJPHJYGAmQtVoYKJ1AGiPlD/bUP0ZmiiAxs1TnOsnOHA75gfIqGrtcaIHtbgdzyx52LpAg2BgG1id4gGM09osXc0jHHlzT2GdcJtHsQhaF48MLoRtis1lz1p9gI3M4UczmWoFKK5Trfu4jkjCFZApaL+RjfAOz/lTUIzwf0F3Nskpv3wWmfGYw0leciXGD634v5pRl yjpark@mbp"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9DrtnNBqknbcaFseJQB/SFCYvJ5RKW3UVz6RQVplS2eDqkNC/WM2Y892q08v/uMrCsA6QQLjHzlG86dGWj4LzF8UfZFJH0892SZW+moHe3j06b4b8ar0Csbl711w0B0AocgjCTxqyUwK/IXNoChG6MRzy0qKW9yFxsGYRjdDOXF8Lfu3geW9/z5jRV6ii3bTrZsOHCqNrkP7gIjNayYYKtOMWtUwg9C2eZHl9Mc/qrSHT+ZU75Zoy55YIX/x5eWvi1Wq+v0UIAtsLBmyfN9lCsxCnmf1HGQagLWGHdd8jyBGloNAxuX+p4C+91smuek/hYdJCLTKHd3s28cKO4QiF yjpark@mbp"
    ];
  };
  security.sudo.extraConfig = ''
    yjpark	ALL=(ALL) NOPASSWD: ALL
  '';
}
