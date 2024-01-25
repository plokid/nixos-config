{ system
, self
, nixpkgs
, inputs
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
  ploki = lib.homeManagerSystem {
    inherit system pkgs;
    specialArgs = { inherit inputs user; };
    modules =
      [
        ./ploki
      ];
  };
}
