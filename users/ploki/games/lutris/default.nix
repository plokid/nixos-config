{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    (lutris.override {
      extraLibraries = pkgs: [
        # List library dependencies here
        libunwind
      ];
      extraPkgs = pkgs: [
        # List package dependencies here
        wine
        winetricks
        vkd3d
      ];
    })
  ];
}

