local nvim_treesitter_setup, treesitter = pcall(require, "nvim-treesitter")
if not nvim_treesitter_setup then
	return
end

treesitter = require('nvim-treesitter.configs')

treesitter.setup {
	ensure_installed = { "c", "lua", "rust" },
	sync_install = false,
	auto_install = true,
	ignore_install = { "javascript" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
	}
}
