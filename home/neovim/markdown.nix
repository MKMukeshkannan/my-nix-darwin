{ pkgs, ... }: {
  programs.nixvim.extraPlugins = [pkgs.vimPlugins."render-markdown-nvim"];
  programs.nixvim.plugins.markdown-preview.enable = true;
  programs.nixvim.plugins.obsidian = {
    enable = true;

    settings = {
      note_id_func = ''
        function(title)
          local suffix = ""
          if title ~= nil then
            suffix = title:gsub(" ", "_"):gsub("[^A-Za-z0-9-]", "")
          else
            for _ = 1, 4 do
              suffix = suffix .. string.char(math.random(65, 90))
            end
          end
          return suffix
        end
      '';
      attachments.img_folder = "assets/imgs";
      completion.nvim_cmp = true;
      workspaces = [
        { name = "electronics"; path = "/Users/mukeshkannan/Library/Mobile Documents/iCloud~md~obsidian/Documents/electronics"; }
        { name = "dev"; path = "/Users/mukeshkannan/Library/Mobile Documents/iCloud~md~obsidian/Documents/dev"; } 
      ];
      mappings = {
        "<leader>ch" = {
          action = "require('obsidian').util.toggle_checkbox";
          opts = {
            buffer = true;
          };
        };
        gf = {
          action = "require('obsidian').util.gf_passthrough";
          opts = {
            buffer = true;
            expr = true;
            noremap = false;
          };
        };
      };
    };
  };
}
