{ inputs, config, pkgs, ... }:

{
    imports = [ 
        ./fastfetch.nix
        ./kitty.nix
        ./zsh.nix
        ./neovim
        inputs.nixvim.homeManagerModules.nixvim
    ];



    home.username = "mukeshkannan";
    home.homeDirectory = "/Users/mukeshkannan";


    home.stateVersion = "24.05";

    programs.home-manager.enable = true;
}