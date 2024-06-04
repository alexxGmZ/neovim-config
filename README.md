# My Neovim Setup

My neovim setup and development workflow

<br>

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
* [Configured LSPs](#configured-lsps)
   + [How to Install LSPs and Do a Basic Configuration](#how-to-install-lsps-and-do-a-basic-configuration)

<br>


### Dependencies

* [Kitty Terminal](https://github.com/kovidgoyal/kitty) (coz it supports font ligature and
other utf-8 characters)
* neovim v0.10.+
* [lazy](https://github.com/folke/lazy.nvim) as the plugin manager
* [Code New Roman Nerd Font](https://www.nerdfonts.com/font-downloads)
* live-server (for nvim-markdown-preview, install by ```npm i -g live-server```)

<br>


### Installation

Enter these commands in the terminal.
```bash
git clone https://github.com/alexxShandsome/neovim-config
cd neovim-config
mkdir -v ~/.config/nvim
cp -vr nvim ~/.config/
```

**Note:** This config doesn't fully work in Windows

<br>


### Plugins

I use [```lazy```](https://github.com/folke/lazy.nvim) as a Plugin Manager

#### Navigation

* [junegunn/fzf                   ](https://github.com/junegunn/fzf)
* [ibhagwan/fzf-lua               ](https://github.com/ibhagwan/fzf-lua)
* [alexghergh/nvim-tmux-navigation](https://github.com/alexghergh/nvim-tmux-navigation)
* [sitiom/nvim-numbertoggle       ](https://github.com/sitiom/nvim-numbertoggle)
* [nvim-tree/nvim-tree.lua        ](https://github.com/nvim-tree/nvim-tree.lua)
* [hedyhli/outline.nvim           ](https://github.com/hedyhli/outline.nvim)
* [folke/trouble.nvim             ](https://github.com/folke/trouble.nvim)

#### Syntax Highlighting

* [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* [mtdl9/vim-log-highlighting     ](https://github.com/MTDL9/vim-log-highlighting)

#### LSP and Auto-Completion

* [gregsexton/MatchTag                ](https://github.com/gregsexton/MatchTag)
* [williamboman/mason.nvim            ](https://github.com/williamboman/mason.nvim)
* [williamboman/mason-lspconfig.nvim  ](https://github.com/williamboman/mason-lspconfig.nvim)
* [neovim/nvim-lspconfig              ](https://github.com/neovim/nvim-lspconfig)
* [hrsh7th/cmp-nvim-lsp               ](https://github.com/hrsh7th/cmp-nvim-lsp)
* [hrsh7th/cmp-buffer                 ](https://github.com/hrsh7th/cmp-buffer)
* [hrsh7th/cmp-path                   ](https://github.com/hrsh7th/cmp-path)
* [hrsh7th/cmp-cmdline                ](https://github.com/hrsh7th/cmp-cmdline)
* [hrsh7th/nvim-cmp                   ](https://github.com/hrsh7th/nvim-cmp)
* [hrsh7th/cmp-vsnip                  ](https://github.com/hrsh7th/cmp-vsnip)
* [hrsh7th/vim-vsnip                  ](https://github.com/hrsh7th/vim-vsnip)
* [m4xshen/autoclose.nvim             ](https://github.com/m4xshen/autoclose.nvim)
* [lukas-reineke/cmp-under-comparator ](https://github.com/lukas-reineke/cmp-under-comparator)
* [hrsh7th/cmp-nvim-lsp-signature-help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help)
* [rafamadriz/friendly-snippets       ](https://github.com/rafamadriz/friendly-snippets)
* [VidocqH/lsp-lens.nvim              ](https://github.com/VidocqH/lsp-lens.nvim)
* [stevearc/conform.nvim              ](https://github.com/stevearc/conform.nvim)

#### Aesthetic or Interface

* [lukas-reineke/indent-blankline.nvim    ](https://github.com/lukas-reineke/indent-blankline.nvim)
* [nvim-lualine/lualine.nvim              ](https://github.com/nvim-lualine/lualine.nvim)
* [akinsho/bufferline.nvim                ](https://github.com/akinsho/bufferline.nvim)
* [nvim-tree/nvim-web-devicons            ](https://github.com/nvim-tree/nvim-web-devicons)
* [rcarriga/nvim-notify                   ](https://github.com/rcarriga/nvim-notify)
* [NMAC427/guess-indent.nvim              ](https://github.com/NMAC427/guess-indent.nvim)
* [nvim-treesitter/nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)
* [folke/twilight.nvim                    ](https://github.com/folke/twilight.nvim)
* [onsails/lspkind.nvim                   ](https://github.com/onsails/lspkind.nvim)
* [folke/todo-comments.nvim               ](https://github.com/folke/todo-comments.nvim)
* [preservim/tagbar                       ](https://github.com/preservim/tagbar)
* [mistricky/codesnap.nvim                ](https://github.com/mistricky/codesnap.nvim)
* [sudoerwx/vim-ray-so-beautiful          ](https://github.com/sudoerwx/vim-ray-so-beautiful)
* [nvimdev/dashboard-nvim                 ](https://github.com/nvimdev/dashboard-nvim)
* [xiyaowong/transparent.nvim             ](https://github.com/xiyaowong/transparent.nvim)

#### Colorscheme

* [catppuccin/nvim            ](https://github.com/catppuccin/nvim)
* [folke/tokyonight.nvim      ](https://github.com/folke/tokyonight.nvim)
* [projekt0n/github-nvim-theme](https://github.com/projekt0n/github-nvim-theme)
* [rose-pine/neovim           ](https://github.com/rose-pine/neovim)
* [yorik1984/newpaper.nvim    ](https://github.com/yorik1984/newpaper.nvim)
* [rebelot/kanagawa.nvim      ](https://github.com/rebelot/kanagawa.nvim)
* [neanias/everforest-nvim    ](https://github.com/neanias/everforest-nvim)
* [mcchrish/zenbones.nvim     ](https://github.com/mcchrish/zenbones.nvim)

#### Git Integration

* [tpope/vim-fugitive       ](https://github.com/tpope/vim-fugitive)
* [idanarye/vim-merginal    ](https://github.com/idanarye/vim-merginal)
* [lewis6991/gitsigns.nvim  ](https://github.com/lewis6991/gitsigns.nvim)
* [akinsho/git-conflict.nvim](https://github.com/akinsho/git-conflict.nvim)

#### Quality of Life

* [uga-rosa/ccc.nvim                 ](https://github.com/uga-rosa/ccc.nvim)
* [numToStr/Comment.nvim             ](https://github.com/numToStr/Comment.nvim)
* [nullchilly/fsread.nvim            ](https://github.com/nullchilly/fsread.nvim)
* [RRethy/vim-illuminate             ](https://github.com/RRethy/vim-illuminate)
* [chrisgrieser/nvim-early-retirement](https://github.com/chrisgrieser/nvim-early-retirement)
* [is0n/jaq-nvim                     ](https://github.com/is0n/jaq-nvim)
* [kylechui/nvim-surround            ](https://github.com/kylechui/nvim-surround)
* [stevearc/oil.nvim                 ](https://github.com/stevearc/oil.nvim)
* [aca/marp.nvim                     ](https://github.com/aca/marp.nvim)
* [f3fora/cmp-spell                  ](https://github.com/f3fora/cmp-spell)
* [dgagn/diagflow.nvim               ](https://github.com/dgagn/diagflow.nvim)
* [nyngwang/NeoZoom.lua              ](https://github.com/nyngwang/NeoZoom.lua/)
* [diepm/vim-rest-console            ](https://github.com/diepm/vim-rest-console)
* [kristijanhusak/vim-dadbod-ui      ](https://github.com/kristijanhusak/vim-dadbod-ui)
* [Wansmer/treesj                    ](https://github.com/Wansmer/treesj)
* [iamcco/markdown-preview.nvim      ](https://github.com/iamcco/markdown-preview.nvim)

<br>

