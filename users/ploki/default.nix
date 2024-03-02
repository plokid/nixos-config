{ config
, lib
, pkgs
, inputs
, ...
}: {
  imports =
    [
      ./desktop/wayland
      ./virtualisation/home.nix
      ./scripts
      ./shell/zsh
      # ./persistence.nix
    ] ++ (import ./editors)
    ++ (import ./programs/common)
    ++ (import ./games)
    ++ (import ./devlop);

  home = {
    username = "ploki";
    homeDirectory = "/home/ploki";
  };
  programs = {
    home-manager.enable = true;
  };

  home.stateVersion = "23.11";

  home.packages =
    (with pkgs; [
      tdesktop
      qq
      thunderbird
      zotero
      wpsoffice-cn
      microsoft-edge
      cabextract
      wine
      winetricks
    ])
  ++ (with pkgs.nur.repos; [
  linyinfeng.wemeet
  rewine.ttf-wps-fonts
  xddxdd.qqmusic
  xddxdd.bilibili
  ]);
}
