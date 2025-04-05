{

  programs.nixvim.colorschemes.cyberdream = {
    enable = true;
    luaConfig.post = ''
      require("cyberdream").setup({
        transparent = true,
        italic_comments = true,
        hide_fillchars = true,
        borderless_pickers = true,
        terminal_colors = true,
        cache = false,
        highlights = {
          Visual = { bg = "#84838A", fg = "black" },
        },
      })

    '';
  };

  # programs.nixvim.colorschemes.gruvbox.enable = true;
  # programs.nixvim.colorschemes.gruvbox.luaConfig.pre = ''
  #   require("gruvbox").setup({
  #     terminal_colors = true,
  #     undercurl = true,
  #     underline = true,
  #     bold = true,
  #     italic = {
  #       strings = true,
  #       emphasis = true,
  #       comments = true,
  #       operators = false,
  #       folds = true,
  #     },
  #     strikethrough = true,
  #     invert_selection = false,
  #     invert_signs = false,
  #     invert_tabline = false,
  #     invert_intend_guides = false,
  #     inverse = true, -- invert background for search, diffs, statuslines and errors
  #     contrast = "", -- can be "hard", "soft" or empty string
  #     palette_overrides = {},
  #     overrides = {},
  #     dim_inactive = true,
  #     transparent_mode = true,
  #   })
  # '';


  # programs.nixvim = {
  #   colorschemes.everforest.enable = true;
  #   colorschemes.everforest.settings.background = "hard";
  #   colorschemes.everforest.settings.diagnostic_line_highlight = 1;
  #   colorschemes.everforest.settings.diagnostic_text_highlight = 1;
  #   colorschemes.everforest.settings.diagnostic_virtual_text = "colored";
  #   colorschemes.everforest.settings.float_style = "dim";
  #   colorschemes.everforest.settings.inlay_hints_background = "dimmed";
  # };
}
