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
      ./persistence.nix
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
