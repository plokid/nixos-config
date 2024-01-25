{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    rustc
    cargo
  ];
  home.file.".cargo/config".source = ./config;
}
