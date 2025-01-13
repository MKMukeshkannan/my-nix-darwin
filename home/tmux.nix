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
      {
        plugin = catppuccin;
        extraConfig = '' 
          set -g @catppuccin_flavour 'frappe'
          set -g @catppuccin_window_tabs_enabled on
          set -g @catppuccin_window_current_number_color "#{@thm_lavender}"
          set -g @catppuccin_date_time "%H:%M"
          '';
      }
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
    '';
  };
}
