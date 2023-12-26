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
      ../../modules/programs/common
    ] ++ (import ../../modules/editors);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
  };
  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "23.11";
}
