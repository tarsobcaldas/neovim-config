local	on_attach = require("noa.lsp.handlers").on_attach
local	capabilities = require("noa.lsp.handlers").capabilities

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
      formatterLineLength = {72},
      latexFormatter = {"latexindent"},
			forwardSearch = {
				executable = { "SumatraPDF" },
				args = {
					"-reuse-instance",
					"%p",
					"-forward-search",
					"%f",
					"%l",
				},
			},
		},
	},
}
