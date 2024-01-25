-- Keymaps are automatically loadem on the VemyLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local lazyterm = function()
	Util.terminal(nil, { cwd = Util.root() })
end
vim.keymap.set("n", "<C-`>", lazyterm, { desc = "Terminal (root dir)" })
vim.keymap.set("t", "<C-`>", "<cmd>close<cr>", { desc = "Hide Terminal" })

vim.keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", {})
vim.keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", {})
vim.keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", {})
vim.keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", {})
vim.keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", {})
vim.keymap.set("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", {})
vim.keymap.set("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", {})
vim.keymap.set("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", {})
vim.keymap.set("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", {})

-- vim.keymap.set("n", "<leader>h", require("hex").toggle(), {})
