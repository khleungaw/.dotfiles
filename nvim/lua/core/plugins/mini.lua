return {
	"echasnovski/mini.nvim",
	event = { "BufEnter" },
	config = function()
		require("mini.surround").setup({
			respect_selection_type = true,
		})

		require("mini.comment").setup()
	end,
}
