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
      ./fcitx5
      ./shell
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
      wineWowPackages.stable
      winetricks
      wechat-uos
      libreoffice
    ])
    ++ (with pkgs.nur.repos; [
      linyinfeng.wemeet
      rewine.ttf-wps-fonts
      xddxdd.qqmusic
      xddxdd.bilibili
    ]);

  fonts.fontconfig.enable = true;
  news.display = "silent";
}
