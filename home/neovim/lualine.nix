{...}: {
  programs.nixvim.plugins.lualine = {
    enable = true;
    luaConfig.post = ''
      require("lualine").setup({
          options = { theme = "auto", },
      })
    '';
  };
}
