{ config, pkgs, user, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
      storageDriver = "btrfs";
    };
  };

  users.groups.docker.members = [ "ploki" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
