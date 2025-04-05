{ inputs, pkgs, ... }: 
{
  imports = [ 
    ./fastfetch.nix
    ./vim.nix
    # ./kitty.nix
    ./zsh.nix
    ./neovim
    ./tmux.nix
    ./yabai.nix
    ./skhd.nix
    inputs.nixvim.homeManagerModules.nixvim
  ];

  home.packages = with pkgs; [ zsh tmuxinator zoxide lazygit yarn nodejs_22 fzf pngpaste yazi tidy-viewer ];
  programs.git.enable = true;
  programs.git = {
    userName = "M K Mukesh Kannan";
    userEmail = "mukeshkannan311@gmail.com";
  };
  programs.zoxide.enable = true;

  programs = {
    direnv = {
      enable = true;
      enableBashIntegration = true; 
        nix-direnv.enable = true;
    };

    zsh.enable = true; 
  };

  home.username = "mukeshkannan";
  home.homeDirectory = "/Users/mukeshkannan";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
