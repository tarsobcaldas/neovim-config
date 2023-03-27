local	on_attach = require("noa.lsp.handlers").on_attach
local	capabilities = require("noa.lsp.handlers").capabilities

require("lspconfig").ltex.setup {
  autostart = false,
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    require("ltex_extra").setup{
      load_langs = { "pt-BR", "en-US" }, -- table <string> : languages for witch dictionaries will be loaded
      init_check = true, -- boolean : whether to load dictionaries on startup
      path = vim.fn.stdpath 'config' .. "/dictionary/", -- string : path to store dictionaries. Relative path uses current working directory
      log_level = "none", -- string : "none", "trace", "debug", "info", "warn", "error", "fatal"
    }
  end,
  settings = {
    ltex = {
        -- your settings.
      checkFrequency="save",
      language="pt-BR",
      additionalRules = {
        enablePickyRules = true,
        motherTongue= "pt-BR",
      };
    }
  }
}

