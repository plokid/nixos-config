{ config, pkgs, user, ... }:

{
  virtualisation = {
    docker.enable = true;
  };

  users.groups.docker.members = [ "ploki" ];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
