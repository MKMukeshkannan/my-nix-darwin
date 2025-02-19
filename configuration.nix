{ pkgs, config, ... }: {
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [ 
    pkgs.ninja
    pkgs.cmake
    pkgs.gnumake
    pkgs.yabai
    pkgs.skhd
    pkgs.kitty
    pkgs.mkalias
    pkgs.ripgrep
    pkgs.wget
    (import ./scripts/xforce.nix { inherit pkgs; })
    (import ./scripts/muxses.nix { inherit pkgs; })
    (import ./scripts/cses_folder.nix { inherit pkgs; })
  ];
  environment.shells = [ pkgs.zsh ];

  homebrew = { 
    enable = true;
    casks = [ "iina" "arc" "raycast" "obsidian" "postman" ];
    brews = [ "node@22" ];
  };

  fonts.packages = [
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
      pkgs.meslo-lgs-nf
  ];

  users = {
    users = {
      mukeshkannan = {
        shell = pkgs.zsh;
        description = "ITZ ME!!!";
        home = "/Users/mukeshkannan";
      };
    };
  };

 
  
  system.defaults = {
    dock.autohide  = true;
    dock.persistent-apps = [
      "${pkgs.kitty}/Applications/Kitty.app"
      "${pkgs.obsidian}/Applications/Obsidian.app"
    ];
    finder.FXPreferredViewStyle = "clmv";
    loginwindow.GuestEnabled  = false;
    NSGlobalDomain.AppleICUForce24HourTime = true;
    NSGlobalDomain.AppleInterfaceStyle = "Dark";
    NSGlobalDomain.KeyRepeat = 2;
    NSGlobalDomain.AppleShowAllExtensions = true;
    NSGlobalDomain._HIHideMenuBar = true;
  };

  system.activationScripts.applications.text = let
    env = pkgs.buildEnv {
      name = "system-applications";
      paths = config.environment.systemPackages;
      pathsToLink = "/Applications";
    };
  in
    pkgs.lib.mkForce ''
# Set up applications.
    echo "setting up /Applications..." >&2
    rm -rf /Applications/Nix\ Apps
    mkdir -p /Applications/Nix\ Apps
    find ${env}/Applications -maxdepth 1 -type l -exec readlink '{}' + |
    while read src; do
      app_name=$(basename "$src")
        echo "copying $src" >&2
        ${pkgs.mkalias}/bin/mkalias "$src" "/Applications/Nix Apps/$app_name"
        done '';

  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";

  programs.zsh.enable = true;  # default shell on catalina
# system.configurationRevision = self.rev or self.dirtyRev or null;
    system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
                       }
