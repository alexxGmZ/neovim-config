return {
   "rachartier/tiny-inline-diagnostic.nvim",
   event = "VeryLazy",
   priority = 1000,
   dependencies = "neovim/nvim-lspconfig",
   config = function()
      local tiny = require("tiny-inline-diagnostic")
      tiny.setup({
         signs = {
            left = "",
            right = "",
            diag = "●",
            arrow = "    ",
            up_arrow = "    ",
            vertical = " │",
            vertical_end = " └",
         },
         hi = {
            error = "DiagnosticError",
            warn = "DiagnosticWarn",
            info = "DiagnosticInfo",
            hint = "DiagnosticHint",
            arrow = "NonText",
            background = "CursorLine", -- Can be a highlight or a hexadecimal color (#RRGGBB)
            mixing_color = "None",     -- Can be None or a hexadecimal color (#RRGGBB). Used to blend the background color with the diagnostic background color with another color.
         },
         blend = {
            factor = 0.27,
         },
         options = {
            -- Show the source of the diagnostic.
            show_source = true,

            -- Throttle the update of the diagnostic when moving cursor, in milliseconds.
            -- You can increase it if you have performance issues.
            -- Or set it to 0 to have better visuals.
            throttle = 100,

            -- The minimum length of the message, otherwise it will be on a new line.
            softwrap = 15,

            -- If multiple diagnostics are under the cursor, display all of them.
            multiple_diag_under_cursor = true,

            -- Enable diagnostic message on all lines.
            multilines = false,

            -- Show all diagnostics on the cursor line.
            show_all_diags_on_cursorline = false,

            -- Enable diagnostics on Insert mode. You should also se the `throttle` option to 0, as some artefacts may appear.
            enable_on_insert = false,

            overflow = {
               -- Manage the overflow of the message.
               --    - wrap: when the message is too long, it is then displayed on multiple lines.
               --    - none: the message will not be truncated.
               --    - oneline: message will be displayed entirely on one line.
               mode = "wrap",
            },

            -- Format the diagnostic message.
            -- Example:
            -- format = function(diagnostic)
            --     return diagnostic.message .. " [" .. diagnostic.source .. "]"
            -- end,
            format = nil,

            --- Enable it if you want to always have message with `after` characters length.
            break_line = {
               enabled = false,
               after = 30,
            },

            virt_texts = {
               priority = 2048,
            },

            -- Filter by severity.
            severity = {
               vim.diagnostic.severity.ERROR,
               vim.diagnostic.severity.WARN,
               vim.diagnostic.severity.INFO,
               vim.diagnostic.severity.HINT,
            },

            -- Overwrite events to attach to a buffer. You should not change it, but if the plugin
            -- does not works in your configuration, you may try to tweak it.
            overwrite_events = nil,
         },
      })

      vim.api.nvim_create_user_command("DiagToggle", function()
         tiny.toggle()
      end, {})
   end
}
