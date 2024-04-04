return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
    "ibhagwan/fzf-lua",              -- optional
  },
  opts = {  },
  keys = {
    { "<leader>g", function() require("neogit").open({kind="split"}) end, desc = "[G]it" }
  }
}
