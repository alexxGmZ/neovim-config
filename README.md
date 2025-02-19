# My Neovim Setup

My neovim setup and development workflow

&nbsp;

### Screenshots

![image1](./assets/images/img1.png)
![image2](./assets/images/img2.png)
![image3](./assets/images/img3.png)
![image4](./assets/images/img4.png)

## Table of Contents

* [Dependencies](#dependencies)
* [Installation](#installation)
* [Plugins](#plugins)
   + [Navigation](#navigation)
   + [Syntax Highlighting](#syntax-highlighting)
   + [LSP and Auto-Completion](#lsp-and-auto-completion)
   + [Aesthetic or Interface](#aesthetic-or-interface)
   + [Colorscheme](#colorscheme)
   + [Git Integration](#git-integration)
   + [Quality of Life](#quality-of-life)

&nbsp;

### Dependencies

* [Kitty Terminal](https://github.com/kovidgoyal/kitty) (coz it supports font ligature and
other utf-8 characters)
* neovim v0.10.+
* [lazy](https://github.com/folke/lazy.nvim) as the plugin manager

&nbsp;

### Installation

Enter these commands in the terminal.
```bash
git clone https://github.com/alexxShandsome/neovim-config
cd neovim-config
mkdir -v ~/.config/nvim
cp -vr nvim ~/.config/
```

> [!WARNING]
> This config doesn't fully work in Windows

&nbsp;

### Plugins

I use [lazy](https://github.com/folke/lazy.nvim) as a Plugin Manager

#### Navigation

* [junegunn/fzf](https://github.com/junegunn/fzf)
* [ibhagwan/fzf-lua](https://github.com/ibhagwan/fzf-lua)
* [alexghergh/nvim-tmux-navigation](https://github.com/alexghergh/nvim-tmux-navigation)
* [sitiom/nvim-numbertoggle](https://github.com/sitiom/nvim-numbertoggle)
* [hedyhli/outline.nvim](https://github.com/hedyhli/outline.nvim)
* [folke/trouble.nvim](https://github.com/folke/trouble.nvim)
* [jinh0/eyeliner.nvim](https://github.com/jinh0/eyeliner.nvim)
* [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

#### Syntax Highlighting

* [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

#### LSP and Auto-Completion

* [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)
* [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
* [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
* [hrsh7th/cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
* [hrsh7th/cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
* [hrsh7th/cmp-path](https://github.com/hrsh7th/cmp-path)
* [hrsh7th/cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline)
* [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
* [hrsh7th/cmp-vsnip](https://github.com/hrsh7th/cmp-vsnip)
* [hrsh7th/vim-vsnip](https://github.com/hrsh7th/vim-vsnip)
* [lukas-reineke/cmp-under-comparator](https://github.com/lukas-reineke/cmp-under-comparator)
* [hrsh7th/cmp-nvim-lsp-signature-help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help)
* [rafamadriz/friendly-snippets](https://github.com/rafamadriz/friendly-snippets)
* [f3fora/cmp-spell](https://github.com/f3fora/cmp-spell)

#### Aesthetic or Interface

* [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
* [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)
* [nvim-tree/nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
* [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)
* [NMAC427/guess-indent.nvim](https://github.com/NMAC427/guess-indent.nvim)
* [nvim-treesitter/nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)
* [onsails/lspkind.nvim](https://github.com/onsails/lspkind.nvim)
* [folke/todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
* [nvimdev/dashboard-nvim](https://github.com/nvimdev/dashboard-nvim)
* [RRethy/vim-illuminate](https://github.com/RRethy/vim-illuminate)
* [folke/zen-mode.nvim](https://github.com/folke/zen-mode.nvim)
* [uga-rosa/ccc.nvim](https://github.com/uga-rosa/ccc.nvim)
* [OXY2DEV/helpview.nvim](https://github.com/OXY2DEV/helpview.nvim)

#### Colorscheme

* [neanias/everforest-nvim](https://github.com/neanias/everforest-nvim)
* [catppuccin/nvim](https://github.com/catppuccin/nvim)
* [aileot/ex-colors.nvim](https://github.com/aileot/ex-colors.nvim)

#### Git Integration

* [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive)
* [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
* [akinsho/git-conflict.nvim](https://github.com/akinsho/git-conflict.nvim)

#### Quality of Life

* [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)
* [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)
* [stevearc/oil.nvim](https://github.com/stevearc/oil.nvim)
* [diepm/vim-rest-console](https://github.com/diepm/vim-rest-console)
* [kristijanhusak/vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui)
* [Wansmer/treesj](https://github.com/Wansmer/treesj)
* [iamcco/markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim)
* [alexxGmZ/player.nvim](https://github.com/alexxGmZ/player.nvim)
* [hat0uma/csvview.nvim](https://github.com/hat0uma/csvview.nvim)
* [alexxGmZ/Md2Pdf](https://github.com/alexxGmZ/Md2Pdf)

&nbsp;

