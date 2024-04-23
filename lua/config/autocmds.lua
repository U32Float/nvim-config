-- Format on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	callback = function()
		vim.lsp.buf.format()
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		require("util").set_workspace()
	end,
})
