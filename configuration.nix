{ pkgs, config, ... }: {

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = [ 
    pkgs.vim 
    pkgs.mkalias
  ];

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
   done
       '';

  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";

  programs.zsh.enable = true;  # default shell on catalina
  # system.configurationRevision = self.rev or self.dirtyRev or null;
  system.stateVersion = 5;
  nixpkgs.hostPlatform = "aarch64-darwin";
}
