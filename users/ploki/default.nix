{ config
, lib
, pkgs
, user
, ...
}: {
  imports =
    [
      ./desktop/wayland
      ./virtualisation/home.nix
      ./scripts
      ./shell/zsh
    ] ++ (import ./editors)
    ++ (import ./programs/common)
    ++ (import ./devlop);

  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
  };
  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "23.11";
}
