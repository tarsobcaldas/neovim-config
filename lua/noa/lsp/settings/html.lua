local	on_attach = require("noa.lsp.handlers").on_attach
local	capabilities = require("noa.lsp.handlers").capabilities
-- capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
  on_attach = on_attach
}
