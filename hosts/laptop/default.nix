{ config
, pkgs
, user
, inputs
, lib
, ...
}: {
  imports =
    (import ./hardware)
    ++ (import ./virtualisation)
    ++ (import ./programs)
    ++ [
      ./fonts
      ./hardware-configuration.nix
      ./desktop/plasma6
      #./desktop/regreet
    ];

  users.mutableUsers = false;
  users.users.root = {
    initialHashedPassword = "$6$WOHLNBh8OsXbdI06$/SN8FhpqLKqtpvIhlbEPi9dLH8e83Sm0.ToA1.GJHUVRlLtGQC82.zETE/tQB22V5Nep0BAxGlvnvFmX7MeA.1";
  };
  programs.zsh.enable = true;
  users.users.${user} = {
    initialHashedPassword = "$6$A1FK3uWo2Be1aWis$4GArVj7tl7yGINX2JOOI/J18s.qVGhS.3fIPwgenbM8i7y4jVb.k/3P2Jxu1BnMTUh.FGtNwxfXQmlm2VTWqc0";
    shell = pkgs.zsh;
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "libvirtd" "video" "audio" ];
  };
  boot = {
    supportedFilesystems = [ "ntfs" ];
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
      systemd-boot = {
        #enable = lib.mkForce false; #lanzaboote
        enable = true;
        consoleMode = "auto";
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      timeout = 3;
    };
    kernelParams = [
      "quiet"
      "splash"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };

  environment.systemPackages = with pkgs; [
    libnotify
    polkit_gnome
    networkmanagerapplet
    alsa-lib
    alsa-utils
    flac
    pulsemixer
    linux-firmware
    sshpass
    #  pkgs.rust-bin.stable.latest.default
    lxappearance
    imagemagick
    cmake
    gnumake
    patchelf
  ];

  services.xserver = {
    xkb.options = "caps:escape";
  };
  console.useXkbConfig = true;

  services.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
  };

  services = {
    dbus.packages = [ pkgs.gcr ];
    getty.autologinUser = "${user}";
    gvfs.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };
  };

  security.polkit.enable = true;
  security.sudo = {
    enable = true;
    extraConfig = ''
      ${user} ALL=(ALL) NOPASSWD:ALL
    '';
  };
  security.doas = {
    enable = true;
    extraConfig = ''
      permit nopass :wheel
    '';
  };
}
