local function if_git_dir()
	local git_dir = vim.fn.system("git rev-parse --git-dir 2> /dev/null")
	return git_dir ~= ""
end

return {
	"akinsho/git-conflict.nvim",
	cond = if_git_dir,
	cmd = "GitConflictListQf",
	version = "*",
	config = function()
		require("git-conflict").setup()
	end
}
