{ ... }: {
  services.skhd = {
    enable = true;
    skhdConfig = ''
      ## MOVE FOCUS
      alt - j : yabai -m window --focus south
      alt - k : yabai -m window --focus north
      alt - h : yabai -m window --focus west 
      alt - l : yabai -m window --focus east

      # MOVE WINDOWS AROUND
      shift + alt - h : yabai -m window --warp west
      shift + alt - j : yabai -m window --warp south
      shift + alt - k : yabai -m window --warp north
      shift + alt - l : yabai -m window --warp east
      
      # SWITCH FOCUS B/W MONITOR 
      alt - q : yabai -m display --focus west
      alt - w : yabai -m display --focus east 
      
      #  MOVE STUFF ACROSS MONITOR
      shift + alt - q : yabai -m window --display east; yabai -m display --focus east;
      shift + alt - w : yabai -m window --display west; yabai -m display --focus west;
      
      # ARANGE: WINDOWS - FLIPS
      alt - x : yabai -m space --mirror y-axis
      alt - y : yabai -m space --mirror x-axis
      
      alt - d : yabai -m window --toggle float --grid 4:4:1:1:2:2
      
      alt - z : yabai -m window --toggle zoom-fullscreen
      alt - = : yabai -m space --balance 
      
      # RESIZE WINDOW SIZE
      alt - a : yabai -m window --resize left:-20:0
      alt - s : yabai -m window --resize bottom:0:20
      alt - w : yabai -m window --resize top:0:-20
      alt - d : yabai -m window --resize right:20:0
    '';
  };
}
