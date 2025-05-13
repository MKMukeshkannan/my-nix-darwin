{ pkgs, ... }: {
  programs.nixvim.extraPlugins = [ pkgs.vimPlugins."hologram-nvim" ];
  programs.nixvim.extraConfigLua = ''
    require('hologram').setup{
      auto_display = true -- WIP automatic markdown image display, may be prone to breaking
    }
'';
}
