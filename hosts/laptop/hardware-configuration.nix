# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config
, lib
, pkgs
, modulesPath
, ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "none";
    fsType = "tmpfs";
    options = [ "defaults" "size=12G" "mode=755" ];
  };

  fileSystems."/nix" = {
    #device = "/dev/disk/by-uuid/49e24551-c0e0-48ed-833d-da8289d79cdd";
    device = "/dev/disk/by-uuid/ed8aaa90-273d-40a2-b14e-fca6544d1a56";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    #device = "/dev/disk/by-uuid/3C0D-7D32";
    device = "/dev/disk/by-uuid/284D-EBCD";
    fsType = "vfat";
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/920121be-c86d-4503-a910-b68048f5d252";
    fsType = "btrfs";
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/b4cff57f-64a0-45e9-bb01-e2d470eaf7f3"; }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp65s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
