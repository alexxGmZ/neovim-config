return {
   "f3fora/cmp-spell",
   dependencies = { "hrsh7th/nvim-cmp" },
   cmd = { "Spell", "SpellToggle" },
   config = function()
      vim.opt.spell = false
      vim.opt.spelllang = { 'en_us' }

      -- enable spell
      vim.api.nvim_create_user_command("Spell", function()
         vim.cmd("set spell")
      end, {})

      -- disble spell
      vim.api.nvim_create_user_command("NoSpell", function()
         vim.cmd("set nospell")
      end, {})

      -- toggle spell
      vim.api.nvim_create_user_command("SpellToggle", function()
         vim.cmd("set invspell")
      end, {})
   end,
}
