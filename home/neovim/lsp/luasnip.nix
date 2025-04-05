{...}: {
  programs.nixvim.plugins.cmp_luasnip.enable = true;
  programs.nixvim.plugins.friendly-snippets.enable = true;
  programs.nixvim.plugins.luasnip = {
    enable = true;
    fromVscode = [{}];
    fromSnipmate = [{paths = ./snippets; }];
    luaConfig.post = ''
      local ls = require("luasnip")

      vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
      vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
      
      vim.keymap.set({"i", "s"}, "<C-E>", function()
      	if ls.choice_active() then
      		ls.change_choice(1)
      	end
      end, {silent = true})
    '';
  };
}
