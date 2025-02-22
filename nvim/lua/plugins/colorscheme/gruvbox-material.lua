local function highlight_overrides()
   local config = vim.fn["gruvbox_material#get_configuration"]()
   local palette = vim.fn["gruvbox_material#get_palette"](
      config.background,
      config.foreground,
      config.colors_override
   )
   -- vim.print(vim.inspect(palette))
   local set_hl = vim.fn["gruvbox_material#highlight"]
   local nvim_set_hl = vim.api.nvim_set_hl

   set_hl("FloatBorder", palette.none, palette.bg0)
   set_hl("FloatTitle", palette.none, palette.bg0)
   set_hl("Function", palette.orange, palette.none)
   set_hl("Keyword", palette.orange, palette.none)
   set_hl("NormalFloat", palette.none, palette.bg0)
   set_hl("Visual", palette.none, palette.bg_visual_red)

   nvim_set_hl(0, "Boolean", { fg = palette.purple[1], bold = true })
   nvim_set_hl(0, "Constant", { fg = palette.orange[1], bold = true })
   nvim_set_hl(0, "CursorLineNr", { fg = palette.green[1], bold = true })
   nvim_set_hl(0, "EyelinerPrimary", { fg = palette.orange[1], bold = true, reverse = true })
   nvim_set_hl(0, "EyelinerSecondary", { fg = palette.blue[1], bold = true, reverse = true })
   nvim_set_hl(0, "Float", { bold = true })
   nvim_set_hl(0, "NvimTreeNormal", { bg = palette.bg0[1] })
   nvim_set_hl(0, "Number", { fg = palette.purple[1], bold = true })
   nvim_set_hl(0, "String", { fg = palette.green[1] })
   nvim_set_hl(0, "TSFunction", { link = "Function" })
   nvim_set_hl(0, "TSFunctionCall", { link = "Function" })
   nvim_set_hl(0, "TSKeyword", { link = "Keyword" })
   nvim_set_hl(0, "TSMethod", { link = "Function" })
   nvim_set_hl(0, "TSMethodCall", { link = "Function" })
   nvim_set_hl(0, "TSParameter", { fg = palette.red[1], bold = true })
   nvim_set_hl(0, "TSString", { link = "String" })
   nvim_set_hl(0, "TSVariable", { fg = palette.none[1], bold = true })
   nvim_set_hl(0, "TreesitterContextBottom", { underline = true })

   nvim_set_hl(0, "@boolean", { link = "Boolean" })
   nvim_set_hl(0, "@constant.lua", { link = "Constant" })
   nvim_set_hl(0, "@number", { link = "Number" })
   nvim_set_hl(0, "@variable.builtin", { fg = palette.yellow[1] })
   nvim_set_hl(0, "@module.builtin", { link = "@variable.builtin" })
   nvim_set_hl(0, "luaFunc", { link = "Function" })
   nvim_set_hl(0, "luaFunction", { link = "Function" })
   nvim_set_hl(0, "vimFuncName", { link = "Function" })
   nvim_set_hl(0, "vimFunction", { link = "Function" })
   nvim_set_hl(0, "vimUserFunc", { link = "Function" })
end

return {
   "sainnhe/gruvbox-material",
   -- priority = 1000,
   lazy = true,
   config = function()
      vim.g.gruvbox_material_enable_italic = false
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_enable_bold = true
      vim.g.gruvbox_material_ui_contrast = "high"
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_float_style = "dim"

      vim.cmd.colorscheme "gruvbox-material"

      highlight_overrides()
      vim.api.nvim_create_autocmd("ColorScheme", {
         group = "HANDSOME",
         pattern = "*",
         callback = function()
            if vim.g.colors_name ~= "gruvbox-material" then
               return
            end

            highlight_overrides()
         end
      })
   end
}
