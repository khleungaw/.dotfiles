return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},
	keys = {
	    { "<leader>P", function() require("dapui").toggle() end, desc = "DA[P] [T]oggle" }
	},
	config = function ()
		require("dapui").setup();
	end
}
