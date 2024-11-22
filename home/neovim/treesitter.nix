{
  programs.nixvim.plugins.treesitter = {
    enable = true;

    settings = {
      auto_install = true;
      ensure_installed = [
        "git_config"
          "git_rebase"
          "gitattributes"
          "gitcommit"
          "gitignore"
          "cpp"
          "rust"
          "nix"
      ];
    };
  };
}
