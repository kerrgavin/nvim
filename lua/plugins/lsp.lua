local lsp = require('lsp-zero').preset({})

lsp.ensure_installed({
	'rust_analyzer',
	'lua_ls'
})

-- local cmp = require('cmp')
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
-- 	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
-- 	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
-- 	['<C-y>'] = cmp.mapping.confirm({ select = true }),
-- 	["<C-Space>"] = cmp.mapping.complete(),
-- })
-- lsp.setup_nvim_cmp({
-- 	snippet = {
-- 		expand = function(args)
-- 			vim.fn["vsnip#anonymous"](args.body)
-- 		end,
-- 	},
-- 	sources = {
-- 		{name = 'nvim_lsp'},
-- 		{name = 'vsnip'}
-- 	},
-- 	mapping = cmp_mappings
-- })


lsp.on_attach(function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup({
	on_init = function(client)
		local path = client.workspace_folders[1].name
		if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
			client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using
						-- (most likely LuaJIT in the case of Neovim)
						version = 'LuaJIT'
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						checkThirdParty = false,
						library = {
							vim.env.VIMRUNTIME,
							"/home/kerr_gavin/.local/share/nvim/lazy/dashboard-nvim/lua",
							"/home/kerr_gavin/.local/share/nvim/lazy/nvim-lspconfig/lua",
							"/home/kerr_gavin/.local/share/nvim/lazy/cmp-nvim-lsp/lua",
							"/home/kerr_gavin/.local/share/nvim/lazy/alpha-nvim/lua"
							-- "${3rd}/luv/library"
							-- "${3rd}/busted/library",
						}
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						-- library = vim.api.nvim_get_runtime_file("", true)
					}
				}
			})

			client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
		end
		return true
	end
})

-- Snippet config
require('luasnip.loaders.from_vscode').lazy_load()

-- Auto-complete configs
local cmp = require('cmp')

cmp.setup({
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	preselect = 'item',
	completion = {
		completeopt = 'menu,menuone,noinsert'
	},
	sources = {
		{name = 'nvim_lsp'},
		{name = 'buffer'},
		{name = 'path'},
		{name = 'luasnip'},
	}
})

require'lspconfig'.texlab.setup({})

lsp.setup()
