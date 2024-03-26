{ system
, self
, nixpkgs
, inputs
, home-manager
, ...
}:
let
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true; # Allow proprietary software
  };

  lib = home-manager.lib;
in
{
  ploki = lib.homeManagerConfiguration {
    inherit pkgs;
    modules =
      [
        ./ploki
        inputs.hyprland.homeManagerModules.default
        {
          nixpkgs = {
            overlays =
              [
                self.overlays.default
                inputs.nur.overlay
              ]
              ++ (import ../overlays);
          };
        }
      ];
  };
}
