{...}: {
   programs.nixvim.extraConfigLua = ''
   function execute_cmake_out()
     local files = vim.fn.glob('./build/bin/*', false, true)  -- List files in build/bin
     if #files > 0 then
        local handle = io.popen(files[1])
        local result = handle:read("*a")
        handle:close()
        print(result)
     else
        print("No files found in build/bin.")
     end
   end
   '';
   programs.nixvim.keymaps = [
     {
       action = "<cmd>:!command clang main.c -o main -g && ./main<CR>";
       key = "<leader>cc";
     }
     {
       action = "<cmd>:!command cmake -S . -B build && cmake --build build<CR>";
       key = "<leader>c";
     }
     {
       action = "<cmd>:lua execute_cmake_out()<CR>";
       key = "<leader>r";
     }
     {
       action = "<cmd>:ObsidianNew<CR>";
       key = "<leader>nn";
     }
     {
       action = ":ObsidianPasteImg<CR>";
       key = "<leader>v"; 
     }
     {
       action = "<cmd>:Neotree toggle<CR>";
       key = "<leader>fd";
       options = { silent = true; };
     }
     {
       action = ":wincmd k<CR>";
       key = "<c-k>";
       options = { silent = true; };
     }
     {
       action = ":wincmd j<CR>";
       key = "<c-j>";
       options = { silent = true; };
     }
     {
       action = ":wincmd h<CR>";
       key = "<c-h>";
       options = { silent = true; };
     }
     {
       action = ":wincmd l<CR>";
       key = "<c-l>";
       options = { silent = true; };
     }
     {
       action = ":lua vim.lsp.buf.format({})<CR>";
       key = "<leader>fj";
       options = { silent = true; };
     }
     {
       action = ''"+y'';
       key = "<leader>y";
     }
     {
       action = ''"+y'';
       key = "<leader>y";
     }
   ];
}


# vim.keymap.set("x", "<leader>p", '"_dp')
# vim.keymap.set("n", "<leader>y", '"+y')
# vim.keymap.set("v", "<leader>y", '"+y')
# vim.keymap.set("n", "<leader>Y", '"+Y')

#vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
# nmap <silent> <c-k> :wincmd k<CR>
# nmap <silent> <c-j> :wincmd j<CR>
# nmap <silent> <c-h> :wincmd h<CR>
# nmap <silent> <c-l> :wincmd l<CR>
# vim.api.nvim_set_keymap('i', '<Esc>', [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], { expr = true, silent = true })
# vim.api.nvim_set_keymap('i', '<C-c>', [[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]], { expr = true, silent = true })
# vim.api.nvim_set_keymap('i', '<BS>', [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]], { expr = true, silent = true })
# vim.api.nvim_set_keymap('i', '<CR>', [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]], { expr = true, silent = true })
# vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true })
# vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true })
