local on_attach = require("noa.lsp.handlers").on_attach
local capabilities = require("noa.lsp.handlers").capabilities

local executable = 'sioyek'
local args = {
   "--reuse-window",
    "--execute-command",
    "toggle_synctex",
    "--inverse-search",
    "texlab inverse-search -i \"%%1\" -l %%2",
    "--forward-search-file",
    "%f",
    "--forward-search-line",
    "%l",
    "%p"
}

require('texlabconfig').setup(config)

require("lspconfig").texlab.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = { documentFormatting = true },
  filetypes = { "tex", "bib", "cls", "sty", "def", "clo" },
  settings = {
    texlab = {
      build = {
        args = { "-interaction=nonstopmode", "-synctex=1", "-shell-escape", "-lualatex", "%f" },
        executable = "latexmk",
        forwardSearchAfter = true,
      },
      chktex = {
        onOpenAndSave = true,
        onEdit = true
      },
      latexindent = {
        ['local'] = vim.fn.expand("~/.indentconfig.yaml"),
        modifyLineBreaks = true,
        replacement = "-r"
      },
      forwardSearch = {
        executable = executable,
        args = args,
      },
    },
  },
}
