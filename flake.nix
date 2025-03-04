{
  description = "MY MACOS SETUP";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    nixvim.url = "github:nix-community/nixvim";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";

    haskell-flake.url = "github:srid/haskell-flake";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, nixvim, home-manager, nix-homebrew, ... }:
  let
    system =  "x86_64-darwin";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [
        (final: prev: {
          cmake = prev.cmake.overrideAttrs (oldAttrs: {
            version = "3.31.5";
            src = prev.fetchurl {
              url = "https://github.com/Kitware/CMake/releases/download/v3.31.5/cmake-3.31.5.tar.gz";
              sha256 = "sha256-ZvtToUVki+VrRvqejMreOk0N/JLkAeUs52va0f6kPSc=";
            };
          });
        })
      ];
    };
  in 
  {
    darwinConfigurations."mkmac" = nix-darwin.lib.darwinSystem {
      modules = [ 
      	./configuration.nix
      {
        environment.systemPackages = [ pkgs.cmake ];
      }

      	home-manager.darwinModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = {inherit inputs;};
            home-manager.users.mukeshkannan = import ./home/home.nix;
        }

        nix-homebrew.darwinModules.nix-homebrew {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "mukeshkannan";
          };
        }


      ];
    };

    darwinPackages = self.darwinConfigurations."mkmac".pkgs;
  };
}
