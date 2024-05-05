local path = "./servers"
local servers = {}

local command = "\\ls " .. path
local fileList = io.popen(command):read("*all")

for file in string.gmatch(fileList, "%S+") do
	local module = require(path .. "." .. file:gsub("%.lua$", ""))
	for key, value in pairs(module) do
			servers[key] = value
	end
end

return servers
