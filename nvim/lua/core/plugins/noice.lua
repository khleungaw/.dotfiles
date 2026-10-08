return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		{ "MunifTanjim/nui.nvim" },
		{ "rcarriga/nvim-notify", opts = { render = "wrapped-compact", stages = "static" } },
	},
	opts = {
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},

		presets = {
			bottom_search = true,      -- use a classic bottom cmdline for search
			command_palette = true,    -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false,        -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true,     -- add a border to hover docs and signature help
		},
	},
	init = function()
		local function set_indent_hl()
			vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#2e3440" }) -- dim, non-scope guides
			-- vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#7aa2f7" }) -- optional: scope color
		end

		set_indent_hl()
		vim.api.nvim_create_autocmd("ColorScheme", { callback = set_indent_hl })
	end,
}
