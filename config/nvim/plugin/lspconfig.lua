
-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pyright'].setup {
	capabilities = capabilities
}

require('lspconfig')['jdtls'].setup{
	capabilities = capabilities
}

require('lspconfig')['html'].setup{
	capabilities = capabilities
}

require('lspconfig')['clangd'].setup{
	capabilities = capabilities
}

require('lspconfig')['sumneko_lua'].setup{
	capabilities = capabilities
}

require('lspconfig')['intelephense'].setup{
	capabilities = capabilities
}

