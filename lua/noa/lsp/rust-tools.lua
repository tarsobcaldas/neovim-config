local rt = require("rust-tools")
local on_attach = require("noa.lsp.handlers").on_attach
local capabilities = require("noa.lsp.handlers").capabilities

rt.setup({
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      ['rust-analyzer'] = {
        car = {
          autoReload = true
        },
        -- rustfmt = {
        --   rangeFormatting = {
        --     enable = true
        --   }
        -- }
      }
    }
  },
  tools = {
    executor = require("rust-tools.executors").toggleterm
  }
})
