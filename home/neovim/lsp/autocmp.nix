{
    programs.nixvim.plugins.coq-nvim = {
        enable = true;
        installArtifacts = true;
        settings = {
            display.preview.border = "single";
            auto_start = true;
            keymap.recommended = false;
            keymap.bigger_preview = "<C-p";
            keymap.jump_to_mark = "<c-l>";
        };
        luaConfig.post = ''
            vim.api.nvim_set_keymap('i', '<Esc>', [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], { expr = true, silent = true })
            vim.api.nvim_set_keymap('i', '<C-c>', [[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]], { expr = true, silent = true })
            vim.api.nvim_set_keymap('i', '<BS>', [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]], { expr = true, silent = true })
            vim.api.nvim_set_keymap( "i", "<CR>", [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]], { expr = true, silent = true })
            vim.api.nvim_set_keymap('i', '<C-j>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true })
            vim.api.nvim_set_keymap('i', '<C-k>', [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true })
        '';
    };
}
