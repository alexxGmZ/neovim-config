vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("alex.core.autocmds")
require("alex.core.keymaps")
require("alex.core.options")
require("alex.core.usercmds")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
	-- ./lua/plugins.lua file
	require("plugins"),

	{
		ui = {
			border = "rounded",
		},

	}
)

-- neovide config
if vim.g.neovide then
	vim.o.guifont = "Fira Code:h9"
	vim.opt.linespace = 0
end
