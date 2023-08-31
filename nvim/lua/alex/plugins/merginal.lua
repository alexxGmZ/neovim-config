local function if_git_dir()
	local git_dir = vim.fn.system("git rev-parse --git-dir 2> /dev/null")
	return git_dir ~= ""
end

return {
	"idanarye/vim-merginal",
	cond = if_git_dir,
	cmd = { "Merginal", "MerginalToggle", "Git" },
	dependencies = {
		"tpope/vim-fugitive",
	}
}
