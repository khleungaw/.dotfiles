return {
	"nvim-telescope/telescope.nvim",
	event = { "VimEnter" },
	branch = "0.1.x",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },

		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == -1
			end,
		},
	},
	keys = {
		{ "<leader>sh", require("telescope.builtin").help_tags, desc = "[S]earch [H]elp" },
		{ "<leader>sk", require("telescope.builtin").keymaps, desc = "[S]earch [K]eymaps" },
		{ "<leader>sf", require("telescope.builtin").find_files, desc = "[S]earch [F]iles" },
		{ "<leader>ss", require("telescope.builtin").builtin, desc = "[S]earch [S]elect Telescope" },
		{ "<leader>sw", require("telescope.builtin").grep_string, desc = "[S]earch current [W]ord" },
		{ "<leader>sg", require("telescope.builtin").live_grep, desc = "[S]earch by [G]rep" },
		{ "<leader>sd", require("telescope.builtin").diagnostics, desc = "[S]earch [D]iagnostics" },
		{ "<leader>sr", require("telescope.builtin").resume, desc = "[S]earch [R]esume" },
		{ "<leader>s.", require("telescope.builtin").oldfiles, desc = '[S]earch Recent Files ("." for repeat)' },
		{ "<leader><leader>", require("telescope.builtin").buffers, desc = "[ ] Find existing buffers" },

		{
			"<leader>/",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end,
			desc = "[/] Fuzzily search in current buffer",
		},

		{
			"<leader>s/",
			function()
				require("telescope.builtin").live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end,
			desc = "[S]earch [/] in Open Files",
		},

		{
			"<leader>s/",
			function()
				require("telescope.builtin").live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end,
			desc = "[S]earch [/] in Open Files",
		},

		{
			"<leader>sn",
			function()
				require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[S]earch [N]eovim files",
		},

		{
			"<leader>bd",
			require("telescope.custom.buffer_delete_picker"),
			desc = "[B]uffer [D]elete",
		},
	},
	opts = {
		extensions = {
			["ui-select"] = {
				require("telescope.themes").get_dropdown(),
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)

		-- Enable Telescope extensions
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
	end,
}
