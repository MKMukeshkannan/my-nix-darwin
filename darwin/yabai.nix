{...}:{
  services.yabai = {
    enable = true;
    config = {
      # external_bar = "all:39:0";
      layout = "bsp";
      # auto_balance = "off";

      mouse_modifier = "alt";
      mouse_action1 = "move";
      mouse_action2 = "resize";

      top_padding = 12;
      bottom_padding = 12;
      left_padding = 12;
      right_padding = 12;
      window_gap = 18;
    };
    extraConfig = ''
        # yabai -m config layout bsp
        yabai -m config window_placement second_child
        yabai -m config mouse_follows_focus on 
        yabai -m mouse_drop_action swap 
        
        yabai -m rule --add app="^System Settings$"    manage=off
        yabai -m rule --add app="^System Information$" manage=off
        yabai -m rule --add app="^System Preferences$" manage=off
        yabai -m rule --add title="Preferences$"       manage=off
        yabai -m rule --add title="Settings$"          manage=off
        
        echo "yabai configuration loaded . . . 🎯 "
    '';
  };
}
