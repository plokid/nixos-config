{ config
, lib
, pkgs
, user
, ...
}: {
  imports =
    [
      ./wayland/home.nix
      ../../../modules/virtualisation/home.nix
      ../../../modules/scripts
      ../../../modules/shell
      ../../../modules/editors
      # ../../../modules/programs/wayland
      # ../../../modules/theme/catppuccin-dark/wayland
      # ../../../modules/theme/catppuccin-light/wayland
      ../../../modules/theme/nord/wayland
      ../../../modules/devlop
    ];

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
  };
  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "23.11";
}
