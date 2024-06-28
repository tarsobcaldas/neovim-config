local on_attach = require("noa.lsp.handlers").on_attach
local capabilities = require("noa.lsp.handlers").capabilities

require('lspconfig').coq_lsp.setup {
  -- The configuration for coq-lsp.nvim.
  -- The following is the default configuration.
  coq_lsp_nvim = {
    -- to be added
  },

  lsp = {
    on_attach = on_attach,
    capabilities = capabilities,
    -- coq-lsp server initialization configurations, defined here:
    -- https://github.com/ejgallego/coq-lsp/blob/main/editor/code/src/config.ts#L3
    -- Documentations are at https://github.com/ejgallego/coq-lsp/blob/main/editor/code/package.json.
    init_options = {
      show_notices_as_diagnostics = true,
    },
    autostart = false, -- use this if you want to manually launch coq-lsp with :LspStart.
  },
}
