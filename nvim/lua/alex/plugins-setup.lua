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
	use "wbthomason/packer.nvim"

	-- catppuccin colorscheme
	use{"catppuccin/nvim",
		as = "catppuccin"
	}

	-- tokyonight colorscheme
	use "folke/tokyonight.nvim"

	-- tmux-navigator
	use "christoomey/vim-tmux-navigator"

	-- indention lines
	use "lukas-reineke/indent-blankline.nvim"

	-- highlight same words
	use "RRethy/vim-illuminate"

	-- commenter
	use "numToStr/Comment.nvim"

	-- treesitter
	use{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate"
	}
	-- treesitter context
	use "nvim-treesitter/nvim-treesitter-context"

	-- tabs
	-- use("akinsho/bufferline.nvim")
	use{ "akinsho/bufferline.nvim",
		tag = "v3.*"
	}

	-- icons
	use "nvim-tree/nvim-web-devicons"

	-- previewe for markdown files to browser
	use{ "davidgranstrom/nvim-markdown-preview",
		opt = true,
		cmd = {'MarkdownPreview'}
	}

	use{ "nullchilly/fsread.nvim",
		opt = true,
		cmd = {'FSRead', 'FSToggle'}
	}

	use{ "manzeloth/live-server",
		opt = true,
		cmd = {'LiveServer'}
	}

	-- lualine
	use "nvim-lualine/lualine.nvim"
	-- navic
	use "SmiteshP/nvim-navic"

	-- file explorer
	use "nvim-tree/nvim-tree.lua"

	-- git stuff
	use "tpope/vim-fugitive"
	use{ "idanarye/vim-merginal",
		opt = true,
		cmd = {'Merginal', 'MerginalToggle'}
	}

	-- fzf
	use "junegunn/fzf"
	use "ibhagwan/fzf-lua"


	-- auto relative number
	use "jeffkreeftmeijer/vim-numbertoggle"

	-- some code summary windows
	-- use("stevearc/aerial.nvim")
	use{ "preservim/tagbar",
		opt = true,
		cmd = {'TagbarOpen', 'TagbarToggle', 'Tagbar'},
		config = vim.cmd("let g:tagbar_sort = 0")
	}

	use "gorbit99/codewindow.nvim"

	-- syntax highlighting for .log files
	use "mtdl9/vim-log-highlighting"

	-- frontend stuff
	use "norcalli/nvim-colorizer.lua"
	use{ "gregsexton/MatchTag",
		ft = {'markdown', 'html', 'php', 'xml', 'javascript'}
	}
	use{ "AndrewRadev/tagalong.vim",
		ft = {'markdown', 'html', 'php', 'xml', 'javascript'}
	}
	use{ "windwp/nvim-ts-autotag",
		ft = {'markdown', 'html', 'php', 'xml', 'javascript'}
	}

	-- lsp
	use "williamboman/nvim-lsp-installer"
	use "neovim/nvim-lspconfig"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-vsnip"
	use "hrsh7th/vim-vsnip"
	use "hrsh7th/vim-vsnip-integ"


	if packer_bootstrap then
		require("packer").sync()
	end
end)
