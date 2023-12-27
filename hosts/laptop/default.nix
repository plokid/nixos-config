{ config
, pkgs
, user
, inputs
, lib
, ...
}: {
  imports =
    (import ../../modules/hardware)
    ++ (import ../../modules/virtualisation)
    ++ (import ../../modules/programs/system)
    ++ [
      ../../modules/fonts
      ./hardware-configuration.nix
      ./wayland
      #  ./x11
    ] ++ [
      ../../modules/fcitx5
    ];

  sops.defaultSopsFile = ../../../secrets/secrets.yaml;
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
    packages =
      (with pkgs; [
        #    tdesktop
        qq
        #    feishu
        thunderbird
        blender
        #    dbeaver
        # aichat
        zotero
        wpsoffice-cn
        microsoft-edge
        hmcl
      ])
      ++ (with config.nur.repos; [
        # linyinfeng.icalingua-plus-plus
        linyinfeng.wemeet
        rewine.ttf-wps-fonts
      ]);
  };
  boot = {
    supportedFilesystems = [ "ntfs" ];
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    #bootspec.enable = true;
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
    #lanzaboote = {
    #  enable = true;
    #  pkiBundle = "/etc/secureboot";
    #};
    kernelParams = [
      "quiet"
      "splash"
      # "nvidia-drm.modeset=1"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };

  environment = {
    persistence."/nix/persist" = {
      directories = [
        "/etc/nixos" # bind mounted from /nix/persist/etc/nixos to /etc/nixos
        "/etc/NetworkManager/system-connections"
        #  "/etc/v2raya"
        #  "/etc/secureboot"
        "/var"
      ];
      files = [
        "/etc/machine-id"
      ];
      users.${user} = {
        directories = [
          "Downloads"
          "Music"
          "Pictures"
          "Documents"
          "Videos"
          "Templates"
          "nixos-config"
          "VMs"
          "Program"
          "Zotero"
          "Games"
          "Desktop"
          ".cache"
          ".config"
          ".thunderbird"
          ".cargo"
          ".local"
          ".mozilla"
          ".zotero"
          {
            directory = ".gnupg";
            mode = "0700";
          }
          {
            directory = ".ssh";
            mode = "0700";
          }
        ];
      };
    };
    systemPackages = with pkgs; [
      libnotify
      cinnamon.nemo
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
      flameshot
    ];
    variables.NIX_REMOTE = "daemon";
  };

  services.xserver = {
    xkbOptions = "caps:escape";
  };
  console.useXkbConfig = true;

  services.xserver.libinput = {
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

  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };

  systemd.services.nix-daemon = {
    environment = {
      TMPDIR = "/var/cache/nix";
    };
    serviceConfig = {
      CacheDirectory = "nix";
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
