vim.opt.termguicolors = true
require("bufferline").setup {
    options = {
        diagnostics = "nvim_lsp",
        offsets = {{
            filetype = "NvimTree",
            text = "Files",
            highlight = "Directory",
            text_align = "left"
        }}
    }
}
