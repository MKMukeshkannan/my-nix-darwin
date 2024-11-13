{pkgs, ...}: {
  programs.tmux = {
    enable = true;

    baseIndex = 1;
    keyMode = "vi";
    prefix = "C-a";
    terminal = "tmux-256color";
    sensibleOnTop = false;


    shell = "${pkgs.zsh}/bin/zsh";

     plugins = with pkgs;
     [
       {
         plugin = tmuxPlugins.catppuccin;
         extraConfig = '' 
           set -g @catppuccin_flavour 'frappe'
           set -g @catppuccin_window_tabs_enabled on
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

        bind r source-file ~/.config/tmux/tmux.conf
    '';
  };
}
