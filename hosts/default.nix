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

  lib = nixpkgs.lib;
  user = "ploki";
in
{
  laptop = lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs user; };
    modules =
      [
        ./laptop
      ]
      ++ [
        ./system.nix
      ]
      ++ [
        inputs.nur.nixosModules.nur
        inputs.hyprland.nixosModules.default
      ];
  };
}
