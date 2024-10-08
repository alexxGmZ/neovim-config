return {
   "is0n/jaq-nvim",
   config = function()
      require("jaq-nvim").setup {
         cmds = {
            -- Uses vim commands
            internal = {
               vim = "source %"
            },

            -- Uses shell commands
            external = {
               markdown   = "glow %",
               python     = "python3 %",
               go         = "go run %",
               sh         = "sh %",
               lua        = "lua %",
               c          = "clang % && ./a.out",
               java       = "java %",
               javascript = "node %"
            }
         },

         behavior = {
            -- Default type
            default     = "terminal",

            -- Start in insert mode
            startinsert = false,

            -- Use `wincmd p` on startup
            wincmd      = false,

            -- Auto-save files
            autosave    = false
         },

         ui = {
            float = {
               -- See ':h nvim_open_win'
               border   = "rounded",

               -- See ':h winhl'
               winhl    = "Normal",
               borderhl = "FloatBorder",

               -- See ':h winblend'
               winblend = 0,

               -- Num from `0-1` for measurements
               height   = 0.8,
               width    = 0.8,
               x        = 0.5,
               y        = 0.5
            },

            terminal = {
               -- Window position
               position = "bot",
               -- Window size
               size     = 15,
               -- Disable line numbers
               line_no  = false
            },
            quickfix = {
               -- Window position
               position = "bot",
               -- Window size
               size     = 10
            }
         }
      }
   end,
   keys = {
      -- { "<leader>rr", function() vim.cmd("Jaq") end, { desc = "Jaq: run code" } }
      { "<leader>rr", "<cmd>Jaq<CR>", desc = "Jaq: run code" }
   },
   opts = {

   }
}
