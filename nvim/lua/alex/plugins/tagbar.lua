return {
	"preservim/tagbar",
	cmd = "TagbarToggle",
	config = function()
		vim.cmd [[
			let g:tagbar_sort = 0
		]]
	end
}
