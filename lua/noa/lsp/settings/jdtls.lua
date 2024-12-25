local on_attach = require("noa.lsp.handlers").on_attach


require('lspconfig').jdtls.setup{
  on_attach = on_attach,
}

