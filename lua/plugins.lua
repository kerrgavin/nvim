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
		'folke/tokyonight.nvim',
		name = 'tokyonight',
		lazy = false,
		priority = 1000,
		opts = {}
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
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
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
	}
},
{
	defaults = {
		lazy = true,
		version = nil, -- dont use version="*"
	}
})
