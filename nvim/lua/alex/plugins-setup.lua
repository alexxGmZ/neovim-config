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
	augroup packer_user_config
		autocmd!
		" autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
		autocmd BufWritePost plugins-setup.lua source <afile> | PackerCompile
	augroup end
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
	use{ "akinsho/bufferline.nvim",
		tag = "v3.*"
	}

	-- icons
	use "nvim-tree/nvim-web-devicons"

	-- lualine (statusline and winbar)
	use "nvim-lualine/lualine.nvim"

	-- navic (winbar)
	use "SmiteshP/nvim-navic"

	-- fzf
	use "junegunn/fzf"

	-- auto relative line number
	use "jeffkreeftmeijer/vim-numbertoggle"

	-- lsp
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	use "neovim/nvim-lspconfig"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-vsnip"
	use "hrsh7th/vim-vsnip"
	use "hrsh7th/vim-vsnip-integ"


	--[[ ----------------------------------
		      Lazy loaded plugins
	------------------------------------- ]]
	use{ "ibhagwan/fzf-lua",
		cmd = {'FzfLua'}
	}

	-- previewe for markdown files to browser
	use{ "davidgranstrom/nvim-markdown-preview",
		-- opt = true,
		cmd = {'MarkdownPreview'}
	}

	use{ "nullchilly/fsread.nvim",
		opt = true,
		cmd = {'FSRead', 'FSToggle'}
	}

	use{ "manzeloth/live-server",
		-- opt = true,
		cmd = {'LiveServer'}
	}

	use{ "nvim-tree/nvim-tree.lua",
		config = function()
			require("alex.plugins.nvim-tree")
		end,
		cmd = {'NvimTreeOpen', 'NvimTreeToggle'}
	}

	-- git stuff
	use{ "tpope/vim-fugitive",
		cond = function()
			local git_dir = vim.fn.system("git rev-parse --git-dir 2> /dev/null")
			return git_dir ~= ""
		end,
	}

	use{ "idanarye/vim-merginal",
		cond = function()
			local git_dir = vim.fn.system("git rev-parse --git-dir 2> /dev/null")
			return git_dir ~= ""
		end,
		cmd = {'Merginal', 'MerginalToggle'}
	}

	use{ "preservim/tagbar",
		-- opt = true,
		cmd = {'TagbarOpen', 'TagbarToggle', 'Tagbar'},
		config = vim.cmd("let g:tagbar_sort = 0")
	}

	use{ "gorbit99/codewindow.nvim",
		-- opt = true,
		config = function()
			require("alex.plugins.codewindow")
		end,
		cmd = {'CWToggle', 'CWOpen'}
	}

	-- syntax highlighting for .log files
	use{ "mtdl9/vim-log-highlighting",
		ft = {'log'}
	}

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
	--[[ ----------------------------------
		    End of Lazy loaded plugins
	------------------------------------- ]]

	if packer_bootstrap then
		require("packer").sync()
	end
end)
