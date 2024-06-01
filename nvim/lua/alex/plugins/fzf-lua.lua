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
					syntax = true,
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
