return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	dependencies = {
		"junegunn/fzf",
		-- "neovim/nvim-lspconfig",
	},
	opts = {
		previewers = {
			builtin = {
				extensions = {
					["svg"] = "chafa",
					["png"] = "chafa",
					["jpg"] = "chafa",
				}
			}
		}
	}
}
