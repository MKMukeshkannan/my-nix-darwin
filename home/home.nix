{ inputs, config, pkgs, ... }:
{
  imports = [ 
    ./fastfetch.nix
    ./kitty.nix
    ./zsh.nix
    ./neovim
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs.git.enable = true;
  programs.vim.enable = true;

  home.username = "mukeshkannan";
  home.homeDirectory = "/Users/mukeshkannan";


  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
