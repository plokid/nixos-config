{ pkgs , ...}: {
  home.file.".config/fcitx5/conf/classicui.conf".source = ./classicui.conf;

  home.file.".local/share/fcitx5/rime".source = ./default.custom.yaml;

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-configtool
      # fcitx5-chinese-addons
      fcitx5-gtk
      (fcitx5-rime.override {
        rimeDataPkgs = with pkgs.nur.repos.linyinfeng.rimePackages; withRimeDeps [ rime-ice ];
      })
    ];
  };
}
