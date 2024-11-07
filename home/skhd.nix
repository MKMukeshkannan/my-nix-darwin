
{
  home.file.".config/skhd/skhdrc".text = ''
    cmd - return : open -n -a "Kitty"
    
    # SWAP WINDOW
    shift + alt - h : yabai -m window --swap west
    shift + alt - j : yabai -m window --swap south
    shift + alt - k : yabai -m window --swap north
    shift + alt - l : yabai -m window --swap east
    
    # MOVE WINDOW
    shift + cmd - h : yabai -m window --warp west
    shift + cmd - j : yabai -m window --warp south
    shift + cmd - k : yabai -m window --warp north
    shift + cmd - l : yabai -m window --warp east
    
    # SEND WINDOW TO A SPACE 
    shift + alt - 1 : yabai -m window --space 1
    shift + alt - 2 : yabai -m window --space 2
    shift + alt - 3 : yabai -m window --space 3
    shift + alt - 4 : yabai -m window --space 4
    shift + alt - 5 : yabai -m window --space 5
    shift + alt - 6 : yabai -m window --space 6
    shift + alt - 7 : yabai -m window --space 7
    shift + alt - 8 : yabai -m window --space 8
    shift + alt - 9 : yabai -m window --space 9
    shift + alt - 0 : yabai -m window --space 10
    
    # MOVES FOCUS BETWEEN WINDOWS IN THE CURRENT FOCUSED DISPLAY
    alt - h : yabai -m window --focus west
    alt - j : yabai -m window --focus south
    alt - k : yabai -m window --focus north
    alt - l : yabai -m window --focus east
    
    # MOVES FOCUS BETWEEN SPACES 
    alt - 1 : yabai -m space --focus 1
    alt - 2 : yabai -m space --focus 2
    alt - 3 : yabai -m space --focus 3
    alt - 4 : yabai -m space --focus 4
    alt - 5 : yabai -m space --focus 5
    alt - 6 : yabai -m space --focus 6
    alt - 7 : yabai -m space --focus 7
    alt - 8 : yabai -m space --focus 8
    alt - 9 : yabai -m space --focus 9
    alt - 0  : yabai -m space --focus 10
    
    alt - q : yabai -m space --destroy
    alt - e : yabai -m window --toggle split
    alt - x : yabai -m window --close
    alt - m : yabai -m window --minimize
    alt - y : yabai -m space --mirror y-axis
    alt - a : yabai -m space --toggle padding; yabai -m space --toggle gap
    alt - d : yabai -m window --focus mouse && \
              yabai -m window --toggle zoom-parent
    alt - t : yabai -m window --toggle float;\
              yabai -m window --grid 4:4:1:1:2:2
    alt - f : yabai -m window --focus mouse && \
              yabai -m window --toggle zoom-fullscreen
    shift + alt - f : yabai -m window --toggle native-fullscreen
    
    # CREATE A NEW SPACE AND FOLLOW FOCUS
    alt - n : yabai -m space --create && \
                      index="$(yabai -m query --displays --display | jq '.spaces[-1]')" && \
                      yabai -m space --focus "\$\{index\}"
    
    # CREATE A NEW SPACE, MOVE WINDOW AND FOLLOW FOCUS
    shift + alt - n : yabai -m space --create && \
                      index="$(yabai -m query --displays --display | jq '.spaces[-1]')" && \
                      yabai -m window --space "\$\{index\}" && \
                      yabai -m space --focus "\$\{index\}"
    
    # balance size of windows
    # alt - = : yabai -m space --balance
    
    
    # increase window size
    alt - left : yabai -m window --resize left:-40:0
    alt - down : yabai -m window --resize bottom:0:40
    alt - up : yabai -m window --resize top:0:-40
    alt - right : yabai -m window --resize right:40:0
    
    # decrease window size
    shift + alt - right : yabai -m window --resize left:40:0
    shift + alt - up: yabai -m window --resize bottom:0:-40
    shift + alt - down : yabai -m window --resize top:0:40
    shift + alt - left : yabai -m window --resize right:-36:0
  '';
}
