-- nvim-navic plugin
local navic = require("nvim-navic")
local navic_on_attach = function(client, bufnr)
	if client.server_capabilities.documentSymbolProvider then
		return navic.attach(client, bufnr)
	end
end

-- cmp-nvim-lsp plugin
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
require('lspconfig')['pyright'].setup {
	capabilities = capabilities,
	on_attach = navic_on_attach
}

require('lspconfig')['jdtls'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

require('lspconfig')['html'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

require('lspconfig')['clangd'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

require('lspconfig')['sumneko_lua'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

require('lspconfig')['intelephense'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

require('lspconfig')['vimls'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

require('lspconfig')['sqls'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

require('lspconfig')['phpactor'].setup{
	capabilities = capabilities,
}

require('lspconfig')['r_language_server'].setup{
	capabilities = capabilities,
	on_attach = navic_on_attach
}

