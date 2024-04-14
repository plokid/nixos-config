{ lib, pkgs, user, ... }:

{
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [
      uosc
      mpris
      seekTo
      convert
      autoload
      thumbfast
      mpv-playlistmanager
    ];
  };
  xdg.configFile = {
    "mpv/mpv.conf".source = ./mpv.conf;
    "mpv/input.conf".source = ./input.conf;
    # "mpv/input_easy.conf".source = ./input_easy.conf;
    "mpv/profiles.conf".source = ./profiles.conf;
    "mpv/script-opts.conf".source = ./script-opts.conf;
    "mpv/script-opts".source = ./script-opts;
    # "mpv/scripts".source = ./scripts;
    "mpv/fonts".source = ./fonts;
  };
}
