return require('lazy').setup({
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons',
		}
	},
	{'Mofiqul/dracula.nvim', as = 'dracula'},
	{ 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
	{
		'nvim-treesitter/nvim-treesitter',
		build = ":TSUpdate"
	},
	{
		'nvim-telescope/telescope.nvim', version = '0.1.4',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
	},
	{
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		dependencies = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'rafamadriz/friendly-snippets'},
		}
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim"
		},
		config = true
	},
	{
		'numToStr/Comment.nvim',
		lazy = false,
	},
	{
		'folke/trouble.nvim',
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		opts = {},
		name = 'render-markdown',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",  -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
			--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
			--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
			--   -- refer to `:h file-pattern` for more examples
			--   "BufReadPre path/to/my-vault/*.md",
			--   "BufNewFile path/to/my-vault/*.md",
			-- },
			dependencies = {
				-- Required.
				"nvim-lua/plenary.nvim",
			},
		}
},
{
	defaults = {
		lazy = true,
		version = nil, -- dont use version="*"
	}
})
