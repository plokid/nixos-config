{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    python3
    poetry
  ];
}
