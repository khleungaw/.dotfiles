local path = "~/.config/nvim/lua/lsp/servers"
local servers = {}

local fileList = vim.fn.glob(path .. "/*.lua", false, true)

for _, file in ipairs(fileList) do
	local moduleName = string.match(file, "([^/]+)%.lua$")
	local module = require("lsp.servers." .. moduleName)
	for key, value in pairs(module) do
		servers[key] = value
	end
end

return servers
