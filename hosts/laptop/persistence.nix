{
  environment.persistence."/nix/persist" = {
    directories = [
      "/etc/nixos" # bind mounted from /nix/persist/etc/nixos to /etc/nixos
      "/etc/NetworkManager/system-connections"
      "/var"
    ];
    files = [
      "/etc/machine-id"
      "/root/.local/share/nix/trusted-settings.json"
    ];
    users.ploki = {
      # allowOther = true;
      # removePrefixDirectory = true;
      directories = [
        "Downloads"
        "Music"
        "Pictures"
        "Documents"
        "Videos"
        "Templates"
        "Public"
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
        ".vscode"
        ".minecraft"
        {
          directory = ".gnupg";
          mode = "0700";
        }
        {
          directory = ".ssh";
          mode = "0700";
        }
      ];
      files = [
        ".hmcl.json"
        ".zsh_history"
      ];
    };
  };

  environment.variables.NIX_REMOTE = "daemon";
  programs.fuse.userAllowOther = true;

  systemd.services.nix-daemon = {
    environment = {
      TMPDIR = "/var/cache/nix";
    };
    serviceConfig = {
      CacheDirectory = "nix";
    };
  };
}
