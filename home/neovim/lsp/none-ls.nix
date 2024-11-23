{
  programs.nixvim.plugins.none-ls = {
    enable = true;
    sources.formatting = {
      clang_format.enable = true;
      prettier.enable = true;
      prettier.disableTsServerFormatter = true;
    };
#    sources.diagnostics.eslint_d.enable = true;

  };
}
 
