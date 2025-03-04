{pkgs, ...}: {
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    keyMode = "vi";
    prefix = "C-a";
    terminal = "tmux-256color";
    sensibleOnTop = false;

    shell = "${pkgs.zsh}/bin/zsh";

    plugins = with pkgs.tmuxPlugins;
    [
      vim-tmux-navigator
    ];
    extraConfig = ''
      set -g mouse on

      unbind %
      unbind '"'
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"

      bind c new-window -c "#{pane_current_path}"
      bind r source-file ~/.config/tmux/tmux.conf

      unbind -n L

      bind -n C-Space run-shell "tmux neww muxses"
      bind -n C-x switch-client -l 

      set-option -g detach-on-destroy off


      set-option -g status-position bottom
      set-option -g status-style bg=black,fg=white
      set-option -g automatic-rename on
       
      set-option -g status-left-length 20
      set-option -g status-left '#[fg=white]#(echo " Session: ")#[fg=brightgreen]#{session_name}'
       
      set-option -g status-justify centre
       
      set-option -g status-right '#[fg=brightgreen]#(date "+%H:%M ")#[fg=white]#(echo " | ")#[fg=purple]#(nowplaying-cli get title)'
       
      set-option -g status-interval 1
       
      set-option -g window-status-format '#{window_index}#(echo " ")#{window_name}#{window_flags}'
      set-option -g window-status-current-format '#[bold,fg=white,bg=purple]#(echo " ")#{window_index}#(echo " ")#{window_name}#(echo " ")#[fg=black,bg=cyan]#(echo " ")#{window_flags}#(echo " ")'
    '';
  };
}
