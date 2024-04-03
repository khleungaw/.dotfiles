return {
	"navarasu/onedark.nvim",
	priority = 1000,
	config = function()
		require("onedark").setup({
			style = "deep",
		})
		require("onedark").load()
	end,
	init = function()
		vim.cmd.colorscheme("onedark")
		vim.cmd.hi("Comment gui=none")
	end,
}
