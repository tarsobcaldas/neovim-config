local on_attach = require("noa.lsp.handlers").on_attach


require('lspconfig').bashls.setup{
  on_attach = on_attach,
}
