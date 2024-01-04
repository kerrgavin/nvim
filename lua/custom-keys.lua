local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<C-n>', [[:NvimTreeToggle<CR>]], {})
vim.g.mapleader = " "
vim.wo.relativenumber = true
vim.wo.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Move to previous/next
map('n', '<A-,>', '<Cmd>bn<CR>', opts)
map('n', '<A-.>', '<Cmd>bp<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>bd<CR>', opts)
-- List buffers
map('n', '<A-b>', '<Cmd>ls<CR>', opts)
