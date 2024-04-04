local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local utils = require("telescope.utils")
local make_entry = require("telescope.make_entry")

local function buffer_delete_picker()
	local opts = {}
	local buffers = {}
	local bufnrs = vim.api.nvim_list_bufs()
	for _, bufnr in ipairs(bufnrs) do
		if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].buflisted then
			table.insert(buffers, {
				bufnr = bufnr,
				flag = " ",
				info = vim.fn.getbufinfo(bufnr)[1],
			})
		end
	end

	if not next(buffers) then
		utils.notify("builtin.buffers", { msg = "No buffers found with the provided options", level = "INFO" })
		return
	end

	local max_bufnr = math.max(unpack(bufnrs))
	opts.bufnr_width = #tostring(max_bufnr)

	pickers
		.new(opts, {
			prompt_title = "Delete Buffers",
			finder = finders.new_table({
				results = buffers,
				entry_maker = make_entry.gen_from_buffer(opts),
			}),
			previewer = conf.grep_previewer(opts),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(_, map)
				actions.select_default:replace(function(prompt_bufnr)
					actions.delete_buffer(prompt_bufnr)

					local current_picker = action_state.get_current_picker(prompt_bufnr)
					local results = current_picker:get_multi_selection()
					if not next(results) then
						actions.close(prompt_bufnr)
					else
						actions.refresh(prompt_bufnr)
					end
				end)

				map("n", "<C-a>", function(prompt_bufnr)
					actions.select_all(prompt_bufnr)
					actions.delete_buffer(prompt_bufnr)
					actions.close(prompt_bufnr)
				end)

				map("i", "<C-a>", function(prompt_bufnr)
					actions.select_all(prompt_bufnr)
					actions.delete_buffer(prompt_bufnr)
					actions.close(prompt_bufnr)
				end)

				return true
			end,
			multi_selection = true,
		})
		:find()
end

return buffer_delete_picker
