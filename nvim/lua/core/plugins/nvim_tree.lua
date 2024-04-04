return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<leader>t", ":NvimTreeToggle<CR>", desc = "[T]oggle tree", silent = true },
	},
	opts = {
		select_prompts = true,
		hijack_cursor = true,

		view = { signcolumn = "auto" },

		renderer = {
			group_empty = true,
			indent_width = 1,
			highlight_git = "none",
			highlight_opened_files = "name",
			highlight_modified = "all",
			highlight_diagnostics = "none",

			icons = {
				modified_placement = "after",
				git_placement = "after",
				diagnostics_placement = "after",
			},
		},

		modified = { enable = true },
		diagnostics = { enable = true },
		filters = { custom = { "^.git$" } },
	},
	config = function(_, opts)
		require("nvim-tree").setup(opts)
		vim.cmd.hi("NvimTreeOpenedHL gui=italic,bold")
	end,
}
