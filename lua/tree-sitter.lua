require 'nvim-treesitter.configs'.setup {
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "json", "java", "yaml", "bash", "rust", "go", "html" },
	sync_install = false,
	auto_install = false,
	highlight = {
		enable = true
	},
}
