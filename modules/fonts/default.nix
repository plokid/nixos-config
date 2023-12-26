{ config
, lib
, pkgs
, ...
}: {
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      nerdfonts
      sarasa-gothic
      twemoji-color-font
      source-sans-pro
      source-code-pro
      source-serif-pro
    ];
    fontconfig = {
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        monospace = [
          "Sarasa Term SC"
          "Noto Sans Mono CJK SC"
          "Sarasa Mono SC"
          "DejaVu Sans Mono"
        ];
        sansSerif = [
          "Noto Sans"
          "Noto Sans CJK SC"
          "Source Han Sans SC"
          "DejaVu Sans"
        ];
        serif = [
          "Noto Serif"
          "Noto Serif CJK SC"
          "Source Han Serif SC"
          "DejaVu Serif"
        ];
      };
    };
  };
}
