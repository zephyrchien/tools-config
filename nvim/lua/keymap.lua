local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

map("n", "<Left>", ":vertical resize -5<CR>", opt)
map("n", "<Right>", ":vertical resize +5<CR>", opt)
map("n", "<Up>", ":resize -5<CR>", opt)
map("n", "<Down>", ":resize +5<CR>", opt)
map("n", "<C-s>", ":w<CR>", opt)
map("n", "<C-q>", ":q<CR>", opt)

-- nvim-tree
map("n", "<C-t>", ":NvimTreeToggle<CR>", opt)

-- bufferline
--map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
--map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
--map("n", "<A-l>", ":BufferLineCloseRight<CR>", opt)
--map("n", "<A-h>", ":BufferLineCloseLeft<CR>", opt)
