local function if_git_dir()
	local git_dir = vim.fn.system("git rev-parse --git-dir 2> /dev/null")
	return git_dir ~= ""
end

return {
	"f-person/git-blame.nvim",
	cond = if_git_dir,
	config = function()
		vim.cmd [[
			let g:gitblame_enabled = 0
			let g:gitblame_date_format = "%x %H:%M"
			let g:gitblame_message_when_not_committed = ""
			let g:gitblame_message_template = " --> <author> • <date> • <sha>: \"<summary>\""
		]]
	end,
	cmd = { "GitBlameToggle", "GitBlameEnable" }
}
