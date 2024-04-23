-- Install lazy
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn
        .system {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
                 lazypath}
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy
vim.g.mapleader = " "

local function config()
    require "vscode-lua.config.keymaps"
    require "vscode-lua.config.autocmds"
    require "vscode-lua.config.options"

    return "vscode-lua.plugins"
end

require("lazy").setup(config())
