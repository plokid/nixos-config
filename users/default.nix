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
    # extraSpecialArgs = { inherit system inputs; };
    modules =
      [
        ./ploki
        inputs.hyprland.homeManagerModules.default
        inputs.emanote.homeManagerModule
        {
          nixpkgs = {
            overlays =
              [
                self.overlays.default
                inputs.neovim-nightly-overlay.overlay
                inputs.rust-overlay.overlays.default
                inputs.picom.overlays.default
                inputs.nil.overlays.default
                inputs.joshuto.overlays.default
                inputs.go-musicfox.overlays.default
                inputs.nixd.overlays.default
                # (import inputs.emacs-overlay)
              ]
              ++ (import ../overlays);
          };
        }
      ];
  };
}
