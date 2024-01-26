{
    environment.persistence."/nix/persist" = {
      directories = [
        "/etc/nixos" # bind mounted from /nix/persist/etc/nixos to /etc/nixos
        "/etc/NetworkManager/system-connections"
        "/var"
      ];
      files = [
        "/etc/machine-id"
      ];
    };

    environment.variables.NIX_REMOTE = "daemon";

    systemd.services.nix-daemon = {
    environment = {
      TMPDIR = "/var/cache/nix";
    };
    serviceConfig = {
      CacheDirectory = "nix";
    };
  };
}