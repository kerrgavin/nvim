local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require('plugins.lazy')
require('custom-keys')
require('clipboard')
require('plugins.file-explorer')
require('plugins.tree-sitter')
require('plugins.file-finder')
require('plugins.statusbar')
require('plugins.lsp')
require('plugins.git')
require('plugins.render-markdown')
require('plugins.obsidian')
require('workflows')
require('colors')
