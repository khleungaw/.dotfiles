return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<leader>t", ":NvimTreeToggle<CR>", desc = "[T]oggle nvim-tree", silent = true },
	},
	lazy = false,
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
		filters = {
			git_ignored = false,
			custom = {
				"^\\.git$",
				"^CMakeFiles$",
				"^CMakeCache.txt$",
				"^cmake_install.cmake$",
				"^Makefile$",
				"^\\.cache$",
			},
		},
	},
	config = function(_, opts)
		require("nvim-tree").setup(opts)
		vim.cmd.hi("NvimTreeOpenedHL gui=italic,bold")

		local api = require("nvim-tree.api")
		local skip = { node_modules = true, build = true, target = true, [".venv"] = true }
		local expanded = false

		api.events.subscribe(api.events.Event.TreeOpen, function()
			if expanded then
				return
			end
			expanded = true
			api.tree.expand_all(nil, {
				expand_until = function(count, node)
					return count < 200 and not skip[node.name]
				end,
			})
		end)
	end,
}
