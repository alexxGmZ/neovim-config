return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	dependencies = {
		"junegunn/fzf",
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
