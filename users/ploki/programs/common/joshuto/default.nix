{ pkgs, config, ... }:
{
  programs.joshuto = {
    enable = true;
  };

  home.packages = with pkgs; [
    file
    # pdftotext
    exiftool
    transmission
    pandoc
    odt2txt
    xlsx2csv
    w3m
    mediainfo
    catdoc
    mu
    # djvutxt
  ];

  home.file.".config/joshuto".source = ./config;
}
