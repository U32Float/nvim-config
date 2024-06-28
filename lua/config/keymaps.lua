local util = require("util")
local tmux = require("nvim-tmux-navigation")

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

map("i", "jk", "<Esc>", { desc = "Escape insert mode" })

map("n", "x", '"_x', { desc = "Delete with copy" })
map("n", "X", '"_X', { desc = "Delete rest of line with copy" })
map("n", "s", '"_d', { desc = "Delete without copy" })
map("v", "s", '"_d', { desc = "Delete without copy" })
map("n", "ss", '"_dd', { desc = "Delete line without copy" })
map("n", "S", '"_D', { desc = "Delete rest of line without copy" })

map("n", "c", '"_c', { desc = "Replace" })
map("n", "C", '"_C', { desc = "Replace rest of line" })
map("v", "c", '"_c', { desc = "Replace" })
map("v", "C", '"_C', { desc = "Replace rest of line" })

map("n", "<cr>", "@q", { desc = "Apply macro (@q)", noremap = false })

map("n", "<Space>n", ":noh <cr>", {
	desc = "Remove highlights",
	silent = true,
	nowait = true,
})

map("n", "<Space>A", "ggVG", {
	desc = "Select all",
})

map("n", "*", "*N", { desc = "Select all occurences", silent = true })

map("n", "<S-l>", "$", { desc = "Go to end of line" })
map("n", "<S-h>", "^", { desc = "Go to beginning of line" })
-- Disable Shift-m
map("n", "<S-m>", "<Nop>", {})

map("v", "<S-l>", "$", { desc = "Go to end of line" })
map("v", "<S-h>", "^", { desc = "Go to beginning of line" })
-- Disable Shift-m
map("v", "<S-m>", "<Nop>", {})

map({ "n", "v" }, "<leader>w", "<cmd>HopWord<cr>", { desc = "Hop to word", nowait = true })
map({ "n", "v" }, "<leader>j", "<cmd>HopLineStartAC<cr>", { desc = "Hop to line under cursor", nowait = true })
map({ "n", "v" }, "<leader>k", "<cmd>HopLineStartBC<cr>", { desc = "Hop to line above cursor", nowait = true })

map({ "i", "n" }, "<a-h>", function()
	tmux.NvimTmuxNavigateLeft()
end, {})
map({ "i", "n" }, "<a-l>", function()
	tmux.NvimTmuxNavigateRight()
end, {})
map({ "i", "n" }, "<a-j>", function()
	tmux.NvimTmuxNavigateDown()
end, {})
map({ "i", "n" }, "<a-k>", function()
	tmux.NvimTmuxNavigateUp()
end, {})

map({ "n" }, "[b", "<cmd>bprev<cr>", { desc = "Prev buffer" })
map({ "n" }, "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })

map({ "i", "n" }, "<a-n>", "<Nop>", {})
map({ "i", "n" }, "<C-h>", "<Nop>", {})
map({ "i", "n" }, "<C-l>", "<Nop>", {})
map({ "i", "n", "v" }, "<C-j>", function()
	require("neoscroll").scroll(25, false, 60, nil, {})
end, { desc = "Scroll down" })
map({ "i", "n", "v" }, "<C-k>", function()
	require("neoscroll").scroll(-25, false, 60, nil, {})
end, { desc = "Scroll up" })

map("n", "<leader>r", function()
	require("neo-tree.command").execute({
		focus = true,
		reveal = true,
		dir = util.get_root(),
		position = "right",
	})
end, { desc = "Reveal file in NeoTree (root dir)" })

map("n", "<leader>e", function()
	require("neo-tree.command").execute({
		toggle = true,
		dir = util.get_root(),
		position = "right",
	})
	-- vim.cmd("WindowsEqualize")
end, { desc = "Explorer NeoTree (root dir)" })

map("n", "<leader>o", function()
	if vim.bo.filetype == "neo-tree" then
		vim.cmd.wincmd("p")
	else
		vim.cmd.Neotree("focus")
	end
end, { desc = "(Un)focus tree" })

map("n", "<leader>h", function()
	vim.cmd("Alpha")
	vim.cmd("BarbarDisable")
	vim.opt.showtabline = 0
end, { desc = "Return to home screen" })

map("n", "<leader>a", "<cmd>Lspsaga code_action<cr>", { desc = "Invoke code action" })

map("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", { desc = "Rename symbol" })

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
