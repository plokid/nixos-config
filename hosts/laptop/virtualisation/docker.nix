{ config, pkgs, user, ... }:

{
  virtualisation = {
    docker = {
      enable = true;
      storageDriver = "btrfs";
      daemon.settings = {
        "registry-mirrors" = [ "https://m6uqx7l9.mirror.aliyuncs.com" ];
      };
    };
  };

  users.groups.docker.members = [ "ploki" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
