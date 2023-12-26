{ config
, lib
, pkgs
, user
, ...
}: {
  imports =
    [
      ./wayland/home.nix
      ../../modules/virtualisation/home.nix
      ../../modules/scripts
      ../../modules/shell/zsh
    ] ++ (import ../../modules/editors)
    ++ (import ../../modules/devlop);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
  };
  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "23.11";
}
