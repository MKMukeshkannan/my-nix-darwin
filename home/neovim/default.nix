{...}: {
  imports = [
    ./lsp
    ./ui
    ./color.nix
    ./options.nix
    ./neotree.nix
    ./keymaps.nix
    ./markdown.nix
    ./dashboard.nix
    ./telescope.nix
    ./treesitter.nix
    ./lsp/none-ls.nix
    ./nvim-surrond.nix
    ./tmux-navigator.nix
    ./indent-blankline.nix
    ./align.nix
    ./harpoon.nix
    ./lualine.nix
    # ./typr.nix
  ];

  programs.nixvim.extraConfigLua = ''vim.opt.conceallevel = 1'';
  # programs.nixvim.extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
  #     name = "recopy";
  #     src = ./recopy.nvim;
  # })];
}
