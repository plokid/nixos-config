{
  description = "My Personal NixOS Configuration";

  outputs =
    inputs @ { self
    , nixpkgs
    , flake-parts
    , home-manager
    , ...
    }:
    let
      user = "ploki";
      selfPkgs = import ./pkgs;
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      imports = [
        inputs.flake-root.flakeModule
        inputs.mission-control.flakeModule
        inputs.treefmt-nix.flakeModule
      ];
      perSystem =
        { config
        , inputs
        , pkgs
        , system
        , lib
        , ...
        }:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [
              self.overlays.default
            ];
          };
        in
        {
          treefmt.config = {
            inherit (config.flake-root) projectRootFile;
            package = pkgs.treefmt;
            programs.nixpkgs-fmt.enable = true;
            programs.prettier.enable = true;
            programs.taplo.enable = true;
            programs.stylua.enable = true;
            programs.shfmt.enable = true;
          };
          mission-control.scripts = {
            Install = {
              description = "After partitioning, formal installation of nixos";
              exec = "sh ./scripts/install.sh";
              category = "Tools";
            };
            update = {
              description = "Update flake inputs what you want,Please check ./scripts/flake-update.sh";
              exec = "sh ./scripts/flake-update.sh";
              category = "Tools";
            };
            rebuild = {
              description = "Switch to new profile";
              exec = "sh ./scripts/rebuild.sh";
              category = "Tools";
            };
            deploy = {
              description = "Remote deployment or local deployment";
              exec = "sh ./scripts/deploy.sh";
              category = "Tools";
            };
            fmt = {
              description = "Format the source tree";
              exec = config.treefmt.build.wrapper;
              category = "Tools";
            };
            blog = {
              description = "Debug my blog";
              exec = ''
                git submodule update --init --recursive
                cd "$FLAKE_ROOT"/blog
                git checkout master
                emanote -L ./.
              '';
              category = "Tools";
            };
            disko = {
              description = "Pre-install,automatically partition and mount";
              exec = "sh ./scripts/disko.sh";
              category = "Tools";
            };
          };

          devShells = {
            #run by `nix devlop` or `nix-shell`(legacy)
            #Temporarily enable experimental features, run by`nix develop --extra-experimental-features nix-command --extra-experimental-features flakes`
            # default = import ./shell.nix { inherit pkgs; };
            default = pkgs.mkShell {
              nativeBuildInputs = with pkgs; [
                git
                neovim
                sbctl
              ];
              inputsFrom = [
                config.flake-root.devShell
                config.mission-control.devShell
              ];
            };
            #run by `nix develop .#<name>`
            secret = with pkgs;
              mkShell {
                name = "secret";
                nativeBuildInputs = [
                  sops
                  age
                  ssh-to-age
                  ssh-to-pgp
                ];
                shellHook = ''
                  export PS1="\e[0;31m(Secret)\$ \e[m"
                '';
              };
          };
        };

      flake = {
        overlays.default = selfPkgs.overlay;
        nixosConfigurations = (
          import ./hosts {
            system = "x86_64-linux";
            inherit nixpkgs self inputs user;
          }
        );
        homeConfigurations = (
          import ./users {
            system = "x86_64-linux";
            inherit nixpkgs self inputs home-manager;
          }
        );
      };
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    impermanence.url = "github:nix-community/impermanence";
    nur.url = "github:nix-community/NUR";
    hypr-contrib.url = "github:hyprwm/contrib";
    flake-parts.url = "github:hercules-ci/flake-parts";
    sops-nix.url = "github:Mic92/sops-nix";
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-root.url = "github:srid/flake-root";
    mission-control.url = "github:Platonic-Systems/mission-control";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    flake-compat = {
      url = "github:inclyc/flake-compat";
      flake = false;
    };
    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  nixConfig = {
    # override the default substituters
    substituters = [
      # cache mirror located in China
      # status: https://mirrors.ustc.edu.cn/status/
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      # status: https://mirror.sjtu.edu.cn/
      "https://mirror.sjtu.edu.cn/nix-channels/store"

      "https://cache.nixos.org"
    ];
  };
}
