# My Neovim Setup

<br>


### Screenshots

I don't own this "GET SHIT DONE" wallpaper and it's not part of the config. It's in my ```kitty.conf```
![image1](./assets/images/img1.png)
Symbols Outline and Nvim Tree
![image2](./assets/images/img2.png)
![image3](./assets/images/img3.png)
Lazy load some plugins
![image4](./assets/images/img4.png)

## Table of Contents

* [Dependencies](#dependencies)
* [Installation](#installation)
* [Plugins](#plugins)
   + [Navigation](#navigation)
   + [Syntax Highlighting](#syntax-highlighting)
   + [LSP or Auto-Completion](#lsp-or-auto-completion)
   + [Aesthetic or Interface](#aesthetic-or-interface)
   + [Git Integration](#git-integration)
   + [Quality of Life](#quality-of-life)
* [Configured LSPs](#configured-lsps)
   + [How to Install LSPs and Do a Basic Configuration](#how-to-install-lsps-and-do-a-basic-configuration)
<!-- + [To Do/s](#to-dos) -->

<br>


### Dependencies

* [Kitty Terminal](https://github.com/kovidgoyal/kitty) (coz it supports font ligature and other utf-8 characters)
* neovim v0.8.0
* [lazy](https://github.com/folke/lazy.nvim) as the plugin manager
* [Fira Code Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)
   and [Victor Mono Font](https://github.com/rubjo/victor-mono) for sweet cursive italics
   (configured in Kitty's ```kitty.conf```)
   ```
      font_family Fira Code Semi Bold
      italic_font Victor Mono Bold Italic
      bold_font Fira Code Bold
      bold_italic_font Victor Mono Bold Italic
   ```
* live-server (for nvim-markdown-preview)

<br>


### Installation

Enter these commands in the terminal.
```bash
git clone https://github.com/alexxShandsome/neovim-config
cd neovim-config
mkdir -v ~/.config/nvim
cp -vr nvim ~/.config/
```

<br>


### Plugins

I use [```lazy```](https://github.com/folke/lazy.nvim) as a Plugin Manager

#### Navigation

* [junegunn/fzf                  ](https://github.com/junegunn/fzf)
* [ibhagwan/fzf-lua              ](https://github.com/ibhagwan/fzf-lua)
* [christoomey/vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)
* [sitiom/nvim-numbertoggle      ](https://github.com/sitiom/nvim-numbertoggle)
* [nvim-tree/nvim-tree.lua       ](https://github.com/nvim-tree/nvim-tree.lua)
* [simrat39/symbols-outline.nvim ](https://github.com/simrat39/symbols-outline.nvim)

#### Syntax Highlighting

* [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
* [mtdl9/vim-log-highlighting     ](https://github.com/MTDL9/vim-log-highlighting)

#### LSP or Auto-Completion

* [gregsexton/MatchTag              ](https://github.com/gregsexton/MatchTag)
* [AndrewRadev/tagalong.vim.git     ](https://github.com/AndrewRadev/tagalong.vim)
* [windwp/nvim-ts-autotag           ](https://github.com/windwp/nvim-ts-autotag)
* [williamboman/mason.nvim          ](https://github.com/williamboman/mason.nvim)
* [williamboman/mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim)
* [neovim/nvim-lspconfig            ](https://github.com/neovim/nvim-lspconfig)
* [hrsh7th/cmp-nvim-lsp             ](https://github.com/hrsh7th/cmp-nvim-lsp)
* [hrsh7th/cmp-buffer               ](https://github.com/hrsh7th/cmp-buffer)
* [hrsh7th/cmp-path                 ](https://github.com/hrsh7th/cmp-path)
* [hrsh7th/cmp-cmdline              ](https://github.com/hrsh7th/cmp-cmdline)
* [hrsh7th/nvim-cmp                 ](https://github.com/hrsh7th/nvim-cmp)
* [hrsh7th/cmp-vsnip                ](https://github.com/hrsh7th/cmp-vsnip)
* [hrsh7th/vim-vsnip                ](https://github.com/hrsh7th/vim-vsnip)

#### Aesthetic or Interface

* [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
* [nvim-lualine/lualine.nvim          ](https://github.com/nvim-lualine/lualine.nvim)
* [catppuccin/nvim                    ](https://github.com/catppuccin/nvim)
* [akinsho/bufferline.nvim            ](https://github.com/akinsho/bufferline.nvim)
* [SmiteshP/nvim-navic                ](https://github.com/SmiteshP/nvim-navic)
* [nvim-tree/nvim-web-devicons        ](https://github.com/nvim-tree/nvim-web-devicons)
* [gorbit99/codewindow.nvim           ](https://github.com/gorbit99/codewindow.nvim)
* [Bekaboo/deadcolumn.nvim            ](https://github.com/Bekaboo/deadcolumn.nvim)
* [folke/noice.nvim                   ](https://github.com/folke/noice.nvim)
* [MunifTanjim/nui.nvim               ](https://github.com/MunifTanjim/nui.nvim)
* [rcarriga/nvim-notify               ](https://github.com/rcarriga/nvim-notify)

#### Git Integration

* [tpope/vim-fugitive     ](https://github.com/tpope/vim-fugitive)
* [idanarye/vim-merginal  ](https://github.com/idanarye/vim-merginal)
* [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

#### Quality of Life

* [norcalli/nvim-colorizer.lua            ](https://github.com/norcalli/nvim-colorizer.lua)
* [nvim-treesitter/nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)
* [numToStr/Comment.nvim                  ](https://github.com/numToStr/Comment.nvim)
* [nullchilly/fsread.nvim                 ](https://github.com/nullchilly/fsread.nvim)
* [davidgranstrom/nvim-markdown-preview   ](https://github.com/davidgranstrom/nvim-markdown-preview)
* [manzeloth/live-server                  ](https://github.com/manzeloth/live-server)
* [RRethy/vim-illuminate                  ](https://github.com/RRethy/vim-illuminate)
* [NMAC427/guess-indent.nvim              ](https://github.com/NMAC427/guess-indent.nvim)

<br>


### Configured LSPs

You can follow the full guide [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md).
```npm``` is a hard dependency. If you already installed ```npm``` then just do a ```:MasonInstall <lsp>```.

* [pyright](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright) (python)
   + ```python3``` and is required.
* [jdtls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls) (java)
   + ```java-devel``` is required.
* [html](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html) (html)
* [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd) (c/c++, objc, objcpp, cuda, proto)
   + ```clang``` is required.
* [sumneko_lua](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua) (lua)
   + ```lua``` is required.
* [intelephense](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#intelephense) (php)
* [vimls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vimls) (vimscript)
* [cssls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls) (css, scss, less)
* [marksman](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#marksman) (markdown)
* [texlab](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html) (LaTeX)
* [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss) (tailwind, etc.)
* [bashls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls) (zsh, bash, sh)
* [lemminx](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lemminx) (xml, xsd, xsl, xslt, svg)

#### How to Install LSPs and Do a Basic Configuration

Using the [```mason.nvim```](https://github.com/williamboman/mason.nvim) plugin and acts
as the lsp mananger, type ```:MasonInstall <lsp-name or the programming language name>```
inside Neovim. Then, open the ```nvim/lua/alex/plugins/lsp/lspconfig.lua``` and add the lsp
client inside the ```LSP_LIST``` table.

```lua
local LSP_LIST = {
   "pyright",
   "jdtls",
   "html",
   "clangd",
   "sumneko_lua",
   "intelephense",
   "vimls",
   "cssls",
   "marksman",
   "texlab",
   "tailwindcss",
   "bashls",
   "lemminx",
   "<add lsp name here>"
}

```

The lsp clients will be looped to do a basic configuration.

```lua
-- loop all the avaibale lsp inside LSP_LIST
for _, lsp_server in pairs(LSP_LIST) do
   -- basic configuration for installed lsp servers
   lspconfig[lsp_server].setup{
      capabilities = cmp_capabilities,
      on_attach = on_attach,
      flags = lsp_flags
   }

   -- custom lsp configuration below

   if lsp_server == "bashls" then
      lspconfig[lsp_server].setup{
         capabilities = cmp_capabilities,
         on_attach = on_attach,
         flags = lsp_flags,
         filetypes = {'zsh', 'bash', 'sh'}
      }
   end
end
```

<br>
