local function if_git_dir()
	local git_dir = vim.fn.system("git rev-parse --git-dir 2> /dev/null")
	return git_dir ~= ""
end

return {
	"https://github.com/NeogitOrg/neogit",
	cond = if_git_dir,
	cmd = "Neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"ibhagwan/fzf-lua",  -- optional
	},
	config = function()
		require("neogit").setup {
			status = {
				recent_commit_count = 20
			},
			log_view = {
				kind = "vsplit"
			},
			integrations = {
				fzf_lua = true
			}
		}
	end
}
