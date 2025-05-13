{pkgs, ...}: {
  programs.tmux = {
    enable = true;

    prefix = "C-a";

    baseIndex = 1;
    keyMode = "vi";
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

bind-key h split-window -p 20 "ghci Main.hs"
bind-key b split-window -p 20 "darwin-rebuild switch --flake .#mkmac --show-trace"
set-option -g detach-on-destroy off


set-option -g status-position bottom 
set-option -g status-style bg=default,fg=white
set-option -g automatic-rename on
 
set-option -g status-left-length 20
set-option -g status-left '#[bold,fg=white,bg=#fe0500]#(echo " ")#{session_name}#(echo " ")'
 
set-option -g status-justify centre
 
set-option -g status-right '#[bold,fg=white,bg=#fe0500]#(echo " ")#(date "+%H:%M ")#[fg=white]'
 
set-option -g status-interval 1
 
set-option -g window-status-format '#{window_index}#(echo " ")#{window_name}#{window_flags}'
set-option -g window-status-current-format '#[bold,fg=white,bg=#fe0500]#(echo " ")#{window_index}#(echo " ")#{window_name}#(echo " ")'
    '';
  };
}
