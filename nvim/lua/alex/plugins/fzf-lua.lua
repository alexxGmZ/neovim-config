return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	dependencies = {
		"junegunn/fzf",
	},
	config = function()
		require("fzf-lua").setup {
			winopts = {},
			previewers = {
				builtin = {
					syntax = false,
					treesitter = { enable = false },
					extensions = {
						["svg"] = "chafa",
						["png"] = "chafa",
						["jpg"] = "chafa",
					}
				}
			}
		}
	end
}
