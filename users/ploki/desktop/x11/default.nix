{ config
, pkgs
, user
, inputs
, lib
, ...
}: {
  imports = [
    # ../../../modules/desktop/bspwm
    ../../../modules/desktop/xmonad
  ];

  environment.systemPackages = with pkgs; [
    xclip
    xorg.xrandr
    xorg.xev
  ];
}
