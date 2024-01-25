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
      #../../../modules/desktop/plasma5/home.nix
      # ../../../modules/programs/wayland
      # ../../../modules/theme/catppuccin-dark/wayland
      # ../../../modules/theme/catppuccin-light/wayland
      # ../../../modules/theme/nord/wayland/default.nix
    ] ++ (import ../../theme/catppuccin-dark/wayland)
    ++ (import ../../programs/wayland);
}
