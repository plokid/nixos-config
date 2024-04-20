{ config
, pkgs
, user
, inputs
, lib
, ...
}: {
  imports = [
    # ../../../modules/desktop/sway
    # ../../../modules/desktop/hyprland
    ../plasma6
  ];

  environment.systemPackages = with pkgs; [
    wl-clipboard
    wlr-randr
    wayland
    wayland-scanner
    wayland-utils
    egl-wayland
    wayland-protocols
    pkgs.xorg.xeyes
    glfw-wayland
    xwayland
    pkgs.qt6.qtwayland
    wev
    wf-recorder
    pkgs.sway-contrib.grimshot
    grim
  ];
}
