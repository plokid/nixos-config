#Qemu/KVM with virt-manager
{ config, pkgs, user, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      virt-manager
    ];
  };
  virtualisation = {
    libvirtd = {
      enable = true;
      # onBoot = "ignore";
    };
  };
  networking.firewall.trustedInterfaces = [ "virbr0" ];
  programs.dconf.enable = true;
  users.groups.libvirtd.members = [ "${user}" ];

  services.samba = {
    enable = true;
    shares = {
      qemu = {
        path = "/home/ploki/Public";
        "read only" = "no";
        "writable" = "yes";
        "browseable" = "yes";
        "public" = "yes";
        "security" = "user";
        "guest ok" = "yes";
        "hosts allow" = "192.168.122.";
        "force user" = "ploki";
      };
    };
  };
}
