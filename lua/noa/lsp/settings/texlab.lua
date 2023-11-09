local on_attach = require("noa.lsp.handlers").on_attach
local capabilities = require("noa.lsp.handlers").capabilities
local executable = 'zathura'
local args = {
  '--synctex-editor-command',
  [[nvim-texlabconfig -file '%{input}' -line %{line}]],
  '--synctex-forward',
  '%l:1:%f',
  '%p',
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
        executable = "arara",
        -- forwardSearchAfter = true,
        -- onSave = true,
      },
      chktex = {
        onOpenAndSave = true,
        onEdit = true
      },
      -- auxDirectory = { "." },
      -- latexFormatter = { "latexindent" },
      -- latexindent = {
      --       ['local'] = vim.fn.expand("~/.indentconfig.yaml"),
      --   modifyLineBreaks = true
      -- },
      forwardSearch = {
        executable = executable,
        args = args,
      },
    },
  },
}
