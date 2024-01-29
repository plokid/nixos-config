{ config
, lib
, pkgs
, ...
}: {
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = (with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      nerdfonts
      sarasa-gothic
      twemoji-color-font
      source-sans-pro
      source-code-pro
      source-serif-pro
      wqy_zenhei
      wqy_microhei
      fira-code
      fira-code-symbols
      fira-code-nerdfont
    ]) ++ (with config.nur.repos;[
      rewine.ttf-wps-fonts
    ]);
    fontconfig = {
      enable = true;
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [
          "Noto Sans Mono CJK SC"
          "Sarasa Mono SC"
          "DejaVu Sans Mono"
        ];
        sansSerif = [
          "Noto Sans CJK SC"
          "Source Han Sans SC"
          "DejaVu Sans"
        ];
        serif = [
          "Noto Serif CJK SC"
          "Source Han Serif SC"
          "DejaVu Serif"
        ];
      };
    };
  };
}
