{
  programs.nixvim.plugins.indent-blankline.enable = true;
  programs.nixvim.plugins.indent-blankline.settings = {
    exclude = {
      buftypes = [ "terminal" "quickfix" ];
      filetypes = [
        ""
        "checkhealth"
        "help"
        "lspinfo"
        "TelescopePrompt"
        "TelescopeResults"
        "yaml"
      ];
    };
  };
}
