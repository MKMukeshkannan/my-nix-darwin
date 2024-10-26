{
    programs.kitty = {
        enable = true;
        font = {
            name = "meslo-lgs-nf";
            size = 14.0;
        };
        # themeFile = "flexoki_light";
        extraConfig = ''
	    hide_window_decorations yes 

            background            #fff
            foreground            #000
            cursor                #000
            cursor_text_color     #000

            selection_foreground  #ffffff
            selection_background  #ff0000
            
            # black
            color0  #000
            color8  #000
            
            # red
            color1  #ff3131
            # light red
            color9  #ff5757
            
            # green
            color2  #00a228
            # light green
            color10 #00d635
            
            # yellow
            color3  #a48300
            # light yellow
            color11  #d7ad02
            
            # blue
            color4  #004aad
            # light blue
            color12 #38b6ff 
            
            # magenta
            color5  #cb6ce6
            # light magenta
            color13 #cf95df
            
            # cyan
            color6  #0097b2
            # lighy cyan
            color14 #1cc0dd 
            
            # light gray
            color7  #737373
            # dark gray
            color15 #545454

            # dim_opacity                0.4
            background_opacity         0.0
            background_blur            40

            window_padding_width 20
            '';
    };

}
