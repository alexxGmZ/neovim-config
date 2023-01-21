# My Neovim Setup

<br>

### Screenshots

I don't own this "GET SHIT DONE" wallpaper and it's not part of the config. It's in my ```kitty.conf```
![image1](./assets/images/img1.png)
![image2](./assets/images/img2.png)
Lazy load some plugins
![image3](./assets/images/img3.png)
Tagbar and nvim-tree
![image4](./assets/images/img4.png)

## Table of Contents
* [Dependencies](#dependencies)
* [Plugins](#plugins)
   + [Navigation](#navigation)
   + [Syntax Highlighting](#syntax-highlighting)
   + [LSP or Auto-Completion](#lsp-or-auto-completion)
   + [Aesthetic or UI](#aesthetic-or-ui)
   + [Git Integration](#git-integration)
   + [Quality of Life](#quality-of-life)
* [Configured LSPs](#configured-lsps)
   + [How to Install LSPs and Do a Basic Configuration](#how-to-install-lsps-and-do-a-basic-configuration)
<!-- + [To Do/s](#to-dos) -->

<br>

### Dependencies
* [Kitty Terminal](https://github.com/kovidgoyal/kitty) (coz it supports font ligature and other utf-8 characters)
* neovim v0.8.0
* [packer](https://github.com/wbthomason/packer.nvim) as the plugin manager
* [Fira Code Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode)
   and [Victor Mono Font](https://github.com/rubjo/victor-mono) for sweet cursive italics
   (configured in Kitty's ```kitty.conf```)
   ```
      font_family Fira Code Semi Bold
      italic_font Victor Mono Bold Italic
      bold_font Fira Code Bold
      bold_italic_font Victor Mono Bold Italic
   ```
* [ctags](https://github.com/universal-ctags/ctags) (for tagbar to work)

<br>

### Plugins

I use [```packer```](https://github.com/wbthomason/packer.nvim) as a Plugin Manager

#### Navigation

* [junegunn/fzf                     ](https://github.com/junegunn/fzf)
* [ibhagwan/fzf-lua                 ](https://github.com/ibhagwan/fzf-lua)
* [preservim/tagbar                 ](https://github.com/preservim/tagbar)
* [christoomey/vim-tmux-navigator   ](https://github.com/christoomey/vim-tmux-navigator)
* [jeffkreeftmeijer/vim-numbertoggle](https://github.com/jeffkreeftmeijer/vim-numbertoggle)
* [nvim-tree/nvim-tree.lua          ](https://github.com/nvim-tree/nvim-tree.lua)

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

<!-- * [maxboisvert/vim-simple-complete](https://github.com/maxboisvert/vim-simple-complete) -->
<!-- * [ackyshake/VimCompletesMe       ](https://github.com/ackyshake/VimCompletesMe) -->

#### Aesthetic or UI

* [lukas-reineke/indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
* [nvim-lualine/lualine.nvim          ](https://github.com/nvim-lualine/lualine.nvim)
* [catppuccin/nvim                    ](https://github.com/catppuccin/nvim)
* [akinsho/bufferline.nvim            ](https://github.com/akinsho/bufferline.nvim)
* [SmiteshP/nvim-navic                ](https://github.com/SmiteshP/nvim-navic)
* [nvim-tree/nvim-web-devicons        ](https://github.com/nvim-tree/nvim-web-devicons)
* [gorbit99/codewindow.nvim           ](https://github.com/gorbit99/codewindow.nvim)

#### Git Integration
* [tpope/vim-fugitive   ](https://github.com/tpope/vim-fugitive)
* [idanarye/vim-merginal](https://github.com/idanarye/vim-merginal)

#### Quality of Life

* [norcalli/nvim-colorizer.lua            ](https://github.com/norcalli/nvim-colorizer.lua)
* [nvim-treesitter/nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)
* [numToStr/Comment.nvim                  ](https://github.com/numToStr/Comment.nvim)
* [nullchilly/fsread.nvim                 ](https://github.com/nullchilly/fsread.nvim)
* [davidgranstrom/nvim-markdown-preview   ](https://github.com/davidgranstrom/nvim-markdown-preview)
* [manzeloth/live-server                  ](https://github.com/manzeloth/live-server)
* [RRethy/vim-illuminate                  ](https://github.com/RRethy/vim-illuminate)

<br>

### Configured LSPs
You can follow the full guide [here](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)
* [pyright](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#pyright) (python)
   + ```python3``` and is required. Install through ```npm```
      - ```npm i -g pyright```
* [jdtls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#jdtls) (java)
   + ```java-devel``` is required
* [html](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html)
   + install through ```npm```
      - ```npm i -g vscode-langservers-extracted```
* [clangd](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#clangd) (c/c++)
   + ```clang``` is required
* [sumneko_lua](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#sumneko_lua) (lua)
   + ```lua``` is required
* [intelephense](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#intelephense) (php)
   + install through ```npm```
      - ```npm i -g intelephese```
* [vimls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#vimls) (vimscript)
   + install through ```npm```
      - ```npm i -g vim-language-server```
* [cssls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#cssls) (css)
   + install through ```npm```
      - ```npm i -g vscode-langservers-extracted```
* [marksman](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#marksman) (markdown)
* [texlab](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#html) (LaTeX)
* [tailwindcss](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tailwindcss) (tailwind)
   + install through ```npm```
      - ```npm install -g @tailwindcss/language-server```
* [bashls](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#bashls) (zsh, bash, sh)
   + install through ```npm```
      - ```npm i -g bash-language-server```

#### How to Install LSPs and Do a Basic Configuration
Using the [```mason.nvim```](https://github.com/williamboman/mason.nvim) plugin and acts as the lsp mananger,
type ```:MasonInstall <lsp-name or the programming language name>``` inside Neovim. Then, open the ```nvim/lua/alex/plugins/lsp/lspconfig.lua```
and add this code at the bottom of the file
```lua
lspconfig['<lsp-server-name-here>'].setup{
   capabilities = capabilities,
   on_attach = on_attach,
   -- additional options below
}

```

<br>

