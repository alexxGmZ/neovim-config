local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()
vim.cmd([[
	" augroup packer_user_config
	" 	autocmd!
	" 	autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
	" augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	-- packer
	use("wbthomason/packer.nvim")

	-- catppuccin colorscheme
	use{"catppuccin/nvim", as = "catppuccin"}

	-- tokyonight colorscheme
	use("folke/tokyonight.nvim")

	-- tmux-navigator
	use("christoomey/vim-tmux-navigator")

	-- indention lines
	use("lukas-reineke/indent-blankline.nvim")

	-- highlight same words
	use("RRethy/vim-illuminate")

	-- commenter
	use("numToStr/Comment.nvim")

	-- treesitter
	use{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
	}
	-- treesitter context
	use("nvim-treesitter/nvim-treesitter-context")

	-- tabs
	-- use("akinsho/bufferline.nvim")
	use{
		"akinsho/bufferline.nvim",
		tag = "v3.*"
	}

	-- icons
	use("nvim-tree/nvim-web-devicons")

	-- previewe for markdown files to browser
	use("davidgranstrom/nvim-markdown-preview")

	use("nullchilly/fsread.nvim")
	use("manzeloth/live-server")

	-- lualine
	use("nvim-lualine/lualine.nvim")
	-- navic
	use("SmiteshP/nvim-navic")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- git stuff
	use("tpope/vim-fugitive")
	use("idanarye/vim-merginal")

	-- fzf
	use("junegunn/fzf")
	use("ibhagwan/fzf-lua")

	-- auto relative number
	use("jeffkreeftmeijer/vim-numbertoggle")

	-- some code summary windows
	use("stevearc/aerial.nvim")
	use{
		"preservim/tagbar",
		run = vim.cmd("let g:tagbar_sort = 0")
	}
	use("gorbit99/codewindow.nvim")

	-- syntax highlighting for .log files
	use("mtdl9/vim-log-highlighting")

	-- frontend stuff
	use("gregsexton/MatchTag")
	use("norcalli/nvim-colorizer.lua")
	use("AndrewRadev/tagalong.vim")
	use("windwp/nvim-ts-autotag")

	-- lsp
	use("williamboman/nvim-lsp-installer")
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/vim-vsnip-integ")


	if packer_bootstrap then
		require("packer").sync()
	end
end)
