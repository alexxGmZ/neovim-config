local aerial_setup, aerial = pcall(require, "aerial")
if not aerial_setup then
	return
end

aerial.setup({
	-- optionally use on_attach to set keymaps when aerial has attached to a buffer
	on_attach = function(bufnr)
		-- Jump forwards/backwards with '{' and '}'
		vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', {buffer = bufnr})
		vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', {buffer = bufnr})
	end,

	filter_kind = false
})
