return {
	jdtls = {
		handlers = {
			["language/status"] = function(_, _)
				vim.print("***")
			end,
			["$/progress"] = function(_, _, _)
				vim.print("---")
			end,
		},
	},
}
