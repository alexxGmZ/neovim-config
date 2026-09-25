return {
   "sammaji/markdown-preview.nvim",
   cmd = {
      "MarkdownPreviewToggle",
      "MarkdownPreview",
      "MarkdownPreviewStop",
   },
   ft = { "markdown" },
   config = function()
      local g = vim.g
      g.mkdp_refresh_slow = 1
      g.mkdp_theme = "light"
   end
}
