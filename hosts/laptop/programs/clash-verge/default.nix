{ pkgs, ... }: {
  programs.clash-verge = {
    enable = true;
    package = pkgs.clash-verge-rev;
    tunMode = true;
    autoStart = true;
  };

  networking.proxy = {
    default = "http://localhost:7897/";
    noProxy = "127.0.0.1,localhost,internal.domain";
  };
}
