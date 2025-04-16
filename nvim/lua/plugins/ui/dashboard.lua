return {
   "nvimdev/dashboard-nvim",
   -- event = 'VimEnter',
   cond = function()
   	if next(vim.fn.argv()) == nil then
   		return true
   	end
   end,
   dependencies = { "nvim-tree/nvim-web-devicons" },
   config = function()
      require("dashboard").setup {
         theme = "hyper",
         disable_move = false,
         shortcut_type = "number",
         config = {
            week_header = {
               enable = true,
               append = {
                  " ",
                  "Al's Personal Development Environment"
               }
            },
            shortcut = {
               {
                  icon = " ",
                  desc = "Files", group = "DiagnosticHint", key = "F",
                  action = function() vim.cmd("OilToggleFloat") end
               },
               {
                  icon = " ",
                  desc = "Fuzzy find", group = "DiagnosticWarn", key = "fz",
                  action = function() vim.cmd("FzfLua files") end
               },
               {
                  icon = " ",
                  desc = "Check updates", group = "DiagnosticHint", key = "cu",
                  action = function() vim.cmd("Lazy check") end
               },
               {
                  icon = " ",
                  desc = "Benchmark", group = "DiagnosticError", key = "B",
                  action = function() vim.cmd("Lazy profile") end
               },
               {
                  icon = " ",
                  desc = "Database", group = "DiagnosticOk", key = "db",
                  action = function()
                     vim.cmd [[
							bdelete
							DBUI
						]]
                  end
               },
               {
                  icon = "󰘬 ",
                  desc = "Git", group = "DiagnosticError", key = "gi",
                  action = function() vim.cmd("Git") end
               },
            },
            project = { enable = false },
            mru = {
               limit = 8,
               cwd_only = true,
               label = "Recent Files"
            },
         },
         hide = {
            statusline = true, -- hide statusline default is true
            tabline = true,    -- hide the tabline
            winbar = true      -- hide winbar
         },
      }
   end,
}
