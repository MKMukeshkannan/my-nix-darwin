{...}: {
  programs.nixvim.plugins.lualine = {
    enable = true;
    luaConfig.post = ''
local function lualine_colors()
    local colors = {
        black = "#000000",
        white = "#ffffff",
        red = "#FE0500",
        green = "#54BF6A",
        blue = "#00F6F7",
        yellow = "#F7FF00",
        gray = "#878888",
        purple = "#9B1FEA",
        darkgray = "#6A6A6B",
        lightgray = "#DEDEDF",
        inactivegray = "#00000000",
        transp = "#00000000",
    }
    return {
        normal = {
            a = { bg = colors.red, fg = colors.black, gui = "bold" },
            b = { bg = colors.lightgray, fg = colors.white },
            c = { bg = colors.transp, fg = colors.gray },
            z = { bg = colors.transp, fg = colors.red },
        },
        insert = {
            a = { bg = colors.blue, fg = colors.black, gui = "bold" },
            b = { bg = colors.lightgray, fg = colors.white },
            c = { bg = colors.transp, fg = colors.white },
            z = { bg = colors.transp, fg = colors.red },
        },
        visual = {
            a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
            b = { bg = colors.lightgray, fg = colors.white },
            c = { bg = colors.transp, fg = colors.black },
            z = { bg = colors.transp, fg = colors.red },
        },
        replace = {
            a = { bg = colors.green, fg = colors.black, gui = "bold" },
            b = { bg = colors.lightgray, fg = colors.white },
            c = { bg = colors.transp, fg = colors.white },
            z = { bg = colors.transp, fg = colors.red },
        },
        command = {
            a = { bg = colors.purple, fg = colors.white, gui = "bold" },
            b = { bg = colors.lightgray, fg = colors.white },
            c = { bg = colors.transp, fg = colors.black },
            z = { bg = colors.transp, fg = colors.red },
        },
        inactive = {
            a = { bg = colors.darkgray, fg = colors.gray, gui = "bold" },
            b = { bg = colors.darkgray, fg = colors.gray },
            c = { bg = colors.transp, fg = colors.gray },
            z = { bg = colors.transp, fg = colors.red },
        },
    }
end

local function get_scrollbar()
    local sbar_chars = {
        "▔",
        "🮂",
        "🬂",
        "🮃",
        "▀",
        "▄",
        "▃",
        "🬭",
        "▂",
        "▁",
    }

    local cur_line = vim.api.nvim_win_get_cursor(0)[1]
    local lines = vim.api.nvim_buf_line_count(0)

    local i = math.floor((cur_line - 1) / lines * #sbar_chars) + 1
    local sbar = string.rep(sbar_chars[i], 2)

    return sbar
end

require("lualine").setup({
    options = {
        component_separators = "",
        section_separators = "",
        theme = lualine_colors(),
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { },
        lualine_y = {},
        lualine_z = { get_scrollbar },
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
})

    '';
  };
}
