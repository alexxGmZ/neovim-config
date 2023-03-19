-- local success, outline = pcall(require, "symbols-outline")
-- if not success then
-- 	return
-- end
-- outline.setup({
-- 	highlight_hovered_item = false,
-- 	autofold_depth = 1
-- })

require("symbols-outline").setup({
	highlight_hovered_item = true,
	autofold_depth = 1,
	auto_unfold_hover = true,
	width = 20,
})
