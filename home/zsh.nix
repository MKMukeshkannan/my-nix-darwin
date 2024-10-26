{pkgs, ...}: {
    programs.zsh.plugins = [
    {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    }
    ];
    programs.zsh = {
        enable = true;
        oh-my-zsh = {
            enable = true;
            plugins = ["git"];
        };

        initExtra = ''
            source ~/.p10k.zsh
            fastfetch
        '';
        shellAliases = {cvim = "vim -c ':vsplit input.txt' -c ':split output.txt' -c ':vertical resize 40' ./main.cpp";};
    };


}
