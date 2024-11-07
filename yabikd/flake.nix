{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  outputs = {self, nixpkgs, ...}: 
  let
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};
  in {

    packages.${system}.default = pkgs.stdenv.mkDerivation {

      name = "yabai";
      srcs = [
        (pkgs.fetchurl {
          url = "https://github.com/koekeishiya/yabai/releases/download/v7.1.5/yabai-v7.1.5.tar.gz";
          sha256 = "53e8739318494c10c3585e1ee229db5b3ee5682895ebd947086950b79d162214";
        })

        # (pkgs.fetchurl {
        #   url = "";
        #   sha256 = "53e8739318494c10c3585e1ee229db5b3ee5682895ebd947086950b79d162214";
        # })
      ];

      installPhase = ''
        echo "dlkfajdl jfl"
        echo "dalkf "
        ls $src
        mkdir -p $out
        cp -r bin $out
      '';

    };

  };
}
