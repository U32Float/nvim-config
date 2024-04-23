return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "|", right = "|" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = true,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { "encoding", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
		opts = {},
		config = function()
			vim.g.barbar_auto_setup = false -- disable auto-setup

			require("barbar").setup({
				auto_hide = 0,
				exclude_ft = { "alpha" },
			})
		end,
		version = "^1.0.0", -- optional: only update when a new 1.x version is released
	},
	{
		"anuvyklack/windows.nvim",
		lazy = false,
		config = function()
			vim.o.winwidth = 10
			vim.o.winminwidth = 10
			vim.o.equalalways = false

			require("windows").setup({
				ignore = {
					buftype = { "quickfix", "terminal" },
				},
			})
		end,
		dependencies = {
			"anuvyklack/middleclass", -- "anuvyklack/animation.nvim" // Bugged
		},
	},
	{
		"dstein64/nvim-scrollview",
		lazy = false,

		config = function()
			require("scrollview").setup({
				excluded_filetypes = { "nerdtree", "alpha" },
				current_only = true,
				winblend = 0,
				base = "right",
				hover = true,
				column = 1,
				signs_on_startup = { "all" },
				diagnostics_severities = { vim.diagnostic.severity.WARN, vim.diagnostic.severity.ERROR },
			})
			vim.g.scrollview_diagnostics_warn_symbol = "W"
			vim.g.scrollview_diagnostics_info_symbol = "I"
			vim.g.scrollview_diagnostics_error_symbol = "E"
		end,
	},
}
