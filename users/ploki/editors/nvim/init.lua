-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
	vim.o.guifont = "Fira Code:h18"
end