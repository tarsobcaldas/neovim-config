local	on_attach = require("noa.lsp.handlers").on_attach
local	capabilities = require("noa.lsp.handlers").capabilities

require("lspconfig").remark_ls.setup{
  on_attach = on_attach,
  capabilities = capabilities
}
