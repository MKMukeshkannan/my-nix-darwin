{ inputs, config, pkgs, ... }:
{
  imports = [ 
    ./fastfetch.nix
    ./kitty.nix
    ./zsh.nix
    ./vim.nix
    ./neovim
    ./tmux.nix
    ./yabai.nix
    ./skhd.nix
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home.packages = with pkgs; [ zsh ];

  programs.git.enable = true;
  programs.git = {
    userName = "M K Mukesh Kannan";
    userEmail = "mukeshkannan311@gmail.com";
  };
  programs.vim.enable = true;

  home.username = "mukeshkannan";
  home.homeDirectory = "/Users/mukeshkannan";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
