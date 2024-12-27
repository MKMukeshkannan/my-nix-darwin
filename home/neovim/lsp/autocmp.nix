{
  programs.nixvim.plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings.sources = [
      { name = "render-markdown"; }
      { name = "nvim_lsp"; }
      { name = "path"; }
      { name = "buffer"; }
    ];
    settings.mapping = {
      __raw = ''
      cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),

          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        })
      '';
    };
  };
}

