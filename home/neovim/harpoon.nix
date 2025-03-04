{...}: {
  programs.nixvim.plugins.harpoon = {
    enable = true;
    enableTelescope = true;
    excludedFiletypes = [ "harpoon" ];
    keymaps = {
      addFile = "<leader>ha";
      navNext = "<leader>hj";
      navPrev = "<leader>hk";
      toggleQuickMenu = "<leader>hh";
    };
  };
}
