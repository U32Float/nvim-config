local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

------------------------------------------------------------------------------

local util = require("util")

vim.g.mapleader = " "

require("lazy").setup("plugins")

vim.g.ready = true
local theme = util.read("theme", { colorscheme = "everforest", background = "dark" })
vim.cmd("colorscheme " .. theme.colorscheme)
vim.cmd("set background=" .. theme.background)

require("config.autocmds")
require("config.options")
require("config.keymaps")

require("nvim-cmp")

require("lsp.mason")
require("lsp.handlers").setup()
require("lsp.null-ls")
