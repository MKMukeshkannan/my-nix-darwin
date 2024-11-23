{pkgs, ...}: {
    programs.zsh.plugins = [
      {
          name = "powerlevel10k";
          src = pkgs.zsh-powerlevel10k;
          file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
        file = "share/zsh-autosuggestions/zsh-autosuggestions.zsh";
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
        file = "share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh";
      }
    ];
    programs.zsh = {
        enable = true;
        oh-my-zsh = {
            enable = true;
            plugins = [ "git" ];
        };

        initExtra = ''
            source ~/.p10k.zsh
            fastfetch
            export CPLUS_INCLUDE_PATH=/Users/mukeshkannan/cpp_stuff
        '';
        shellAliases = {cvim = "vim -c ':vsplit input.txt' -c ':split output.txt' -c ':vertical resize 40' ./main.cpp";};
    };


}
