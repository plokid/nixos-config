{ config, pkgs, ... }:

{
  home.package = with pkgs; [
    python3
    poetry
  ];
}
