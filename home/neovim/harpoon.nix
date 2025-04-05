{...}: {
  programs.nixvim.plugins.harpoon = {
    enable = true;
    enableTelescope = true;
    excludedFiletypes = [ "harpoon" ];
    keymaps = {
      addFile = "<leader>a";
      navNext = "<leader>j";
      navPrev = "<leader>k";
      toggleQuickMenu = "<leader>aa";
    };
  };
}
