local user_augroup = vim.api.nvim_create_augroup("HANDSOME", {})

-- trim trailing whitespaces
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	group = user_augroup,
	callback = function()
		local curr_pos = vim.fn.winsaveview()
		vim.cmd([[%s/\s\+$//e]])
		vim.fn.winrestview(curr_pos)
	end
})

-- hide linenumber in terminal buffertype
vim.api.nvim_create_autocmd("TermOpen", {
	pattern = "*",
	group = user_augroup,
	callback = function()
		vim.cmd([[setlocal nonumber norelativenumber]])
	end
})

-- show cmdline
vim.api.nvim_create_autocmd("CmdlineEnter", {
	pattern = "*",
	group = user_augroup,
	callback = function()
		vim.opt.cmdheight = 1
	end
})

-- hide cmdline
vim.api.nvim_create_autocmd({ "CmdlineLeave", "UIEnter" }, {
	pattern = "*",
	group = user_augroup,
	callback = function()
		vim.opt.cmdheight = 0
	end
})
