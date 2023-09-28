local map = vim.api.nvim_set_keymap

map('n', '<C-n>', [[:NvimTreeToggle<CR>]], {})
vim.g.mapleader = " "
vim.wo.relativenumber = true
vim.wo.number = true
