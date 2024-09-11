return {
	{
		"williamboman/mason.nvim",
		lazy = false,
	},
	{
		"williamboman/mason-lspconfig.nvim", -- Bridge between mason & lspconfig
	},
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{
		"glepnir/lspsaga.nvim",
		config = function()
			require("lspsaga").setup({
				symbol_in_winbar = { enable = true, folder_level = 3 },
				lightbulb = { enable = false },
			})
		end,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{ "onsails/lspkind.nvim" },
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = {
					enable = true,
				},
				ensure_installed = {
					"vimdoc",
					"luadoc",
					"vim",
					"lua",
					"markdown",
				},
			})
		end,
	},
}
