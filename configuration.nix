{ pkgs, config, ... }: {
    nixpkgs.config.allowUnfree = true;

    # imports = [ ./darwin/yabai.nix  ./darwin/skhd.nix ];

    environment.systemPackages = [ 
        pkgs.kitty
        pkgs.mkalias
        (import ./scripts/xforce.nix { inherit pkgs; })
    ];

    homebrew = { 
	enable = true;
	casks = [ "iina" "arc" ];
    };

#     services.yabai = {
# 	enable = true;
# 	config = {
# 	    # external_bar = "all:39:0";
# 	    layout = "bsp";
# 	    # auto_balance = "off";
# 	    
# 	    mouse_modifier = "alt";
# 	    mouse_action1 = "move";
# 	    mouse_action2 = "resize";
# 	    
# 	    top_padding = 12;
# 	    bottom_padding = 12;
# 	    left_padding = 12;
# 	    right_padding = 12;
# 	    window_gap = 18;
#     	};		
#     	extraConfig = ''
#     	    # yabai -m config layout bsp
#     	    yabai -m config window_placement second_child
#     	    yabai -m config mouse_follows_focus on 
#     	    yabai -m mouse_drop_action swap 
#     	    
#     	    yabai -m rule --add app="^System Settings$"    manage=off
#     	    yabai -m rule --add app="^System Information$" manage=off
#     	    yabai -m rule --add app="^System Preferences$" manage=off
#     	    yabai -m rule --add title="Preferences$"       manage=off
#     	    yabai -m rule --add title="Settings$"          manage=off
#     	    
#     	    echo "yabai configuration loaded . . . 🎯 "
#     	'';
#     };


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
