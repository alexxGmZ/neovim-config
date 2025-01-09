return {
   "folke/zen-mode.nvim",
   cmd = "ZenMode",
   keys = {
      { "<C-w>m", "<cmd>ZenMode<CR>", desc = "ZenMode: Toggle Zen mode" }
   },
   opts = {
      window = {
         backdrop = 0.95,
         width = 100,
         height = 1,
         options = {
            -- signcolumn = "no", -- disable signcolumn
            -- number = false, -- disable number column
            -- relativenumber = false, -- disable relative numbers
            -- cursorline = false, -- disable cursorline
            -- cursorcolumn = false, -- disable cursor column
            -- foldcolumn = "0", -- disable fold column
            -- list = false, -- disable whitespace characters
         },
      },
      plugins = {
         options = {
            enabled = true,
            ruler = false,
            showcmd = false,
            laststatus = 0,
         },
         twilight = { enabled = false },
         gitsigns = { enabled = false },
         tmux = { enabled = false },
         kitty = { enabled = false, font = "+4" },
         alacritty = { enabled = false, font = "14" },
         wezterm = { enabled = false, font = "+4" },
      },
      on_open = function(win)
      end,
      on_close = function()
      end,
   }
}
