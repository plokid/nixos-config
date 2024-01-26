{ config
, lib
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
    username = "ploki";
    homeDirectory = "/home/ploki";
  };
  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "23.11";
}
