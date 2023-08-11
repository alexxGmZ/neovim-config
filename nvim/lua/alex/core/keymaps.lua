vim.g.mapleader = " "
local map = vim.keymap

-- terminal
map.set("t", "<Esc>", "<C-\\><C-n>")
-- map.set("n", "<leader>vst", ":vsplit term://$SHELL<CR>")
-- map.set("n", "<leader>spt", ":split term://$SHELL<CR>")
-- map.set("n", "<leader>tnt", ":tabnew term://$SHELL<CR>")
map.set("n", "<leader>vst", function() vim.cmd("vsplit term://$SHELL") end)
map.set("n", "<leader>spt", function() vim.cmd("split term://$SHELL") end)
map.set("n", "<leader>tnt", function() vim.cmd("tabnew term://$SHELL") end)

-- motions
map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")
map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")
map.set("n", "<C-o>", "<C-o>zz")
map.set("n", "<C-i>", "<C-i>zz")

-- nvim-tree
-- map.set("n", "<leader>F", ":NvimTreeToggle<CR>")
map.set("n", "<leader>F", function () vim.cmd("NvimTreeToggle") end)
map.set("n", "<F6>", function () vim.cmd("NvimTreeToggle") end)

-- write and quit
map.set("n", "<leader>ww", ":w<CR>")
map.set("n", "<leader>wq", ":wq<CR>")
map.set("n", "<leader>wa", ":wa<CR>")
map.set("n", "<leader>qq", ":q<CR>")
map.set("n", "<leader>qa", ":qa<CR>")

-- nohlsearch
map.set("n", "<Esc>", function() vim.cmd("noh") end)

-- fzf
map.set("n", "<C-p>", function () vim.cmd("FzfLua files") end)
-- map.set("n", "<C-p>", function () require("fzf-lua").files() end)

-- split resizing
map.set("n", "<leader>-", "<C-w>3-")
map.set("n", "<leader>=", "<C-w>3+")
map.set("n", "<leader>.", "<C-w>3>")
map.set("n", "<leader>,", "<C-w>3<")

-- jaq
map.set("n", "<leader>rr", ":Jaq<CR>")

-- NeoZoom
map.set("n", "<C-w>m", function ()	vim.cmd("NeoZoomToggle") end,
	{
		silent = true,
		nowait = true
	}
)

-- codewindow
map.set("n", "<leader>mm", function() vim.cmd("CWToggle") end)
