return { -- Autoformat
	"stevearc/conform.nvim",
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		formatters_by_ft = {
			lua = {},
			rust = { "rustfmt" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
		},
		formatters = {
			rustfmt = {
				command = "rustfmt",
				args = { "+nightly", "--edition", "2021", "--emit", "stdout" },
			},
			prettier = {
				command = "bun",
				args = { "x", "prettier", "--stdin-filepath", "$FILENAME" },
			},
		},
	},
}
