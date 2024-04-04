-- [[ Basic Keymaps ]]
vim.keymap.set("i", "<C-y>", vim.cmd.red, { desc = "Redo" })
vim.keymap.set("n", "<C-y>", vim.cmd.red, { desc = "Redo" })
vim.keymap.set("i", "<C-z>", vim.cmd.u, { desc = "Undo" })
vim.keymap.set("n", "<C-z>", vim.cmd.u, { desc = "Undo" })

vim.keymap.set("n", "<C-s>", vim.cmd.w, { desc = "Save" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { desc = "Save", silent = true })
vim.keymap.set("n", "<leader>q", vim.cmd.q, { desc = "[q]uit" })
vim.keymap.set("n", "<leader>Q", vim.cmd.qa, { desc = "[Q]uit Neovim" })

vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copy" })

vim.keymap.set("n", "<Tab>", ">>_", { desc = "Incrase indent" })
vim.keymap.set("v", "<Tab>", ">gv", { desc = "Incrase indent" })
vim.keymap.set("n", "<S-Tab>", "<<_", { desc = "Decrease indent" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "Decrease indent" })

vim.keymap.set("n", "<S-Left>", "b", { desc = "Previous word" })
vim.keymap.set("n", "<S-Right>", "w", { desc = "Next word" })
vim.keymap.set("n", "<S-Up>", "{", { desc = "Previous paragraph" })
vim.keymap.set("n", "<S-Down>", "}", { desc = "Next paragraph" })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won"t work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-Left>", "<C-w><C-h>", { desc = "Move focus to the left window", silent = true })
vim.keymap.set("n", "<C-Right>", "<C-w><C-l>", { desc = "Move focus to the right window", silent = true })
vim.keymap.set("n", "<C-Down>", "<C-w><C-j>", { desc = "Move focus to the lower window", silent = true })
vim.keymap.set("n", "<C-Up>", "<C-w><C-k>", { desc = "Move focus to the upper window", silent = true })

vim.keymap.set("i", "<C-Left>", "<Esc><C-w><C-h>", { desc = "Move focus to the left window", silent = true })
vim.keymap.set("i", "<C-Right>", "<Esc><C-w><C-l>", { desc = "Move focus to the right window", silent = true })
vim.keymap.set("i", "<C-Down>", "<Esc><C-w><C-j>", { desc = "Move focus to the lower window", silent = true })
vim.keymap.set("i", "<C-Up>", "<Esc><C-w><C-k>", { desc = "Move focus to the upper window", silent = true })
