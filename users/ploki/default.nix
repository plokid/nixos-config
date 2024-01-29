{ config
, lib
, pkgs
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
      blender
      zotero
      wpsoffice-cn
      microsoft-edge
      hmcl
      cabextract
    ]);
  # ++ (with config.nur.repos; [
  # linyinfeng.icalingua-plus-plus
  # linyinfeng.wemeet
  # rewine.ttf-wps-fonts
  # xddxdd.qqmusic
  # xddxdd.bilibili
  # YisuiMilena.hmcl-bin
  # ]);
}
