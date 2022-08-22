local on_attach = require("noa.lsp.handlers").on_attach
local capabilities = require("noa.lsp.handlers").capabilities
local executable = 'zathura'
local args = { '-x', '%l:1:%f', '%p'}
local config = {
    cache_activate = true,
    cache_filetypes = { 'tex', 'bib' },
    cache_root = vim.fn.stdpath('cache'),
    reverse_search_edit_cmd = 'edit',
    file_permission_mode = 438,
}

require('texlabconfig').setup(config)

require("lspconfig").texlab.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = { documentFormatting = true },
  -- filetypes = { "tex", "bib", "cls", "sty", "def", "clo" },
  settings = {
    texlab = {
      build = {
        args = { "-interaction=nonstopmode", "-synctex=1", "-shell-escape", "%f" },
        executable = "latexmk",
        forwardSearchAfter = true,
        onSave = true,
      },
      chktex = {
        onOpenAndSave = true,
        onEdit = true
      },
      auxDirectory = { "aux" },
      formatterLineLength = { 72 },
      latexFormatter = { "latexindent" },
      latexindent = {
        ['local'] = vim.fn.expand('~/.indentconfig'),
        modifyLineBreaks = true
      },
      forwardSearch = {
        executable = executable,
        args = args,
      },
    },
  },
}
