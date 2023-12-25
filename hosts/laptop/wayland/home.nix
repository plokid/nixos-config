{ config
, lib
, pkgs
, user
, impermanence
, ...
}: {
  imports =
    [
      # ../../../modules/desktop/sway/home.nix
      # ../../../modules/desktop/hyprland/home.nix
      ../../../modules/desktop/plasma5/home.nix
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
