local	on_attach = require("noa.lsp.handlers").on_attach
local	capabilities = require("noa.lsp.handlers").capabilities

require'lspconfig'.html.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
