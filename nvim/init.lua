local function load_dir(mod)
  local path = vim.fn.stdpath("config") .. "/lua/" .. mod:gsub("%.", "/")
  for _, file in ipairs(vim.fn.glob(path .. "/*.lua", false, true)) do
    local name = vim.fn.fnamemodify(file, ":t:r")
    if name ~= "init" then
      require(mod .. "." .. name)
    end
  end
end

-- [[ Settings ]]
load_dir("core.settings")
load_dir("core.autocmds")

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require("lazy").setup({
	spec = {
		{ import = "core.plugins" },
	},
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙'",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
	change_detection = { notify = false },
})

-- [[ LSP ]]
vim.lsp.enable('lua_ls')
vim.lsp.enable('rust_analyzer')
