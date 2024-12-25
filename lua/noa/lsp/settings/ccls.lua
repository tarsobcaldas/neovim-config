-- local capabilities = require("noa.lsp.handlers").capabilities


require('lspconfig').clangd.setup{
  on_attach = on_attach,
}
