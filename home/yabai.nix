{
  home.file.".config/yabai/yabairc".text = ''
    yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"
    sudo yabai --load-sa

    yabai -m config layout bsp
    
    yabai -m config window_placement second_child
    
    
    yabai -m config top_padding 12
    yabai -m config bottom_padding 12
    yabai -m config left_padding 12
    yabai -m config right_padding 12
    yabai -m config window_gap 18 
    
    yabai -m config mouse_follows_focus on 
    
    yabai -m config mouse_modifier alt 
    yabai -m config mouse_action1 move 
    yabai -m config mouse_action2 resize 
    yabai -m mouse_drop_action swap 
    
    
    yabai -m rule --add app="^System Settings$" manage=off
    yabai -m rule --add app="^Calculator$" manage=off
    yabai -m rule --add app="^Karabiner-Elements$" manage=off
    yabai -m rule --add app="^QuickTime Player$" manage=off
    yabai -m rule --add app="^ruin$" manage=off
    yabai -m rule --add app="^RUIN.*$" manage=off
    yabai -m rule --add app="^ruin-opengl-example$" manage=off
    yabai -m rule --add title="^RUIN.*$" manage=off
    
    echo "yabai configuration loaded . . . 🎯 "
  '';
}
