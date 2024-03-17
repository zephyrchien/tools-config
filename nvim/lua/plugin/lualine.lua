require("lualine").setup {
    options = {
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 5000,
            winbar = 5000
        }
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch"},
        lualine_c = {"require('lsp-status').status()"},
        lualine_x = {"encoding", "filetype"},
        lualine_y = {"progress"},
        lualine_z = {"location"}
    },
    inactive_sections = {
        lualine_a = {"location"},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
    }
}
